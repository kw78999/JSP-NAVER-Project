package in;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import com.oreilly.servlet.MultipartRequest;

import member.MemberBean;

public class AnswerMgr {
	private DBConnectionMgr pool;
	
	public AnswerMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//답변입력
	public boolean insertAnswer(AnswerBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert in_answer(qnum,id,content,date) values(?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,bean.getQnum());
			pstmt.setString(2,bean.getId());
			pstmt.setString(3,bean.getContent());
			if(pstmt.executeUpdate()==1)flag=true;
			
			pstmt.close();
				
				sql = "update navermember set AnswerCnt = AnswerCnt+1 where id = ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, bean.getId());
				pstmt.executeUpdate();
		
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	// 답변 가져오기
		public Vector<AnswerBean> getAnswerList(int qnum){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<AnswerBean> vlist = new Vector<AnswerBean>();
			try {
				con = pool.getConnection();
				sql = "select * from in_answer where qnum = ? order by choice desc";  //채택답변은 제일먼저 가져오기
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,qnum);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AnswerBean bean = new AnswerBean();
				bean.setAnum(rs.getInt("anum"));
				bean.setId(rs.getString("id"));
				bean.setGrade(rs.getString("grade"));
				bean.setContent(rs.getString("content"));
				bean.setDate(rs.getString("date"));
				vlist.addElement(bean);
			  }
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
		
		//답변삭제
		public void deleteAnswer(int anum) {
			System.out.println(anum);
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "delete from in_answer where anum = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,anum);
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return ;
		}
	
		//답변 수정
		public void updateAnswer(int anum,String content) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "update in_answer set content=? where anum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, content);
				pstmt.setInt(2, anum);
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
		//오늘의 질문 갯수
				public int getQuestionCnt(){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int cnt=0;
					try {
						con = pool.getConnection();
						sql = "SELECT COUNT(*) FROM `in_question` WHERE DATE_FORMAT(date, \"%Y-%m-%d\") = CURDATE()";
						pstmt = con.prepareStatement(sql);
					    rs = pstmt.executeQuery();
					    if(rs.next())
					    cnt = rs.getInt("COUNT(*)");
					}catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return cnt;
				}
				
		//오늘의 답변 갯수
		public int getAnswerCnt(){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			int cnt=0;
			try {
				con = pool.getConnection();
				sql = "SELECT COUNT(*) FROM `in_answer` WHERE DATE_FORMAT(date, \"%Y-%m-%d\") = CURDATE()";
				pstmt = con.prepareStatement(sql);
			    rs = pstmt.executeQuery();
			    if(rs.next())
			    cnt = rs.getInt("COUNT(*)");
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return cnt;
		}
		//모든 답변 갯수
				public int getAllAnswerCnt(){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int cnt=0;
					try {
						con = pool.getConnection();
						sql = "SELECT COUNT(*) FROM `in_answer`";
						pstmt = con.prepareStatement(sql);
					    rs = pstmt.executeQuery();
					    if(rs.next())
					    cnt = rs.getInt("COUNT(*)");
					}catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return cnt;
				}
				//답변 채택
				public boolean choiceAnswer(int anum,int qnum) {
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					boolean flag=false;
					try {
						//게시글에서 판별하기위한 초이스넘버 
						con = pool.getConnection();
						sql = "update in_question set choice=? where qnum=?"; 
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, anum);
						pstmt.setInt(2, qnum);
						pstmt.executeUpdate();
						
						//답변중 채택답변을 판별하기위한 초이스 넘버 
						pstmt.close();
						sql = "update in_answer set choice=? where anum=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, 1);
						pstmt.setInt(2, anum);
						pstmt.executeUpdate();
						pstmt.close();
						
						//게시글의 포인트만큼 채택답변 아이디에 추가하기 
						sql = "UPDATE navermember set inPoint = inPoint+"
								+ "(SELECT POINT FROM in_question WHERE qnum = ?) "
								+ "WHERE id = (SELECT id FROM in_answer WHERE anum = ?);";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, qnum);
						pstmt.setInt(2, anum);
						if(pstmt.executeUpdate()==1)flag=true;
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt);
					}return flag;
				}
				
				//내공 가장많은 아이디 조회
				public MemberBean pid(){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					MemberBean bean = new MemberBean();
					try {
						con = pool.getConnection();
						sql = "SELECT id,inPoint FROM navermember WHERE inPoint=(SELECT MAX(inPoint) FROM navermember)"; //내공 가장많은 아이디
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						if(rs.next())
						bean.setId(rs.getString("id"));
						bean.setInPoint(rs.getInt("inPoint"));
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return bean;
				}
				//질문수 가장많은 아이디
				public MemberBean qid(){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					MemberBean bean = new MemberBean();
					try {
						con = pool.getConnection();
						sql = "SELECT id,questionCnt FROM navermember WHERE questionCnt=(SELECT MAX(questionCnt) FROM navermember)"; //내공 가장많은 아이디
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						if(rs.next())
						bean.setId(rs.getString("id"));
						bean.setQuestionCnt(rs.getInt("questionCnt"));
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return bean;
				}
				//답변수 가장많은 아이디
				public MemberBean aid(){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					MemberBean bean = new MemberBean();
					try {
						con = pool.getConnection();
						sql = "SELECT id,answerCnt FROM navermember WHERE answerCnt=(SELECT MAX(answerCnt) FROM navermember)"; //내공 가장많은 아이디
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						if(rs.next())
						bean.setId(rs.getString("id"));
						bean.setAnswerCnt(rs.getInt("answerCnt"));
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return bean;
				}
				//조회수 가장많은 질문
				public QuestionBean hitq(){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					QuestionBean bean = new QuestionBean();
					try {
						con = pool.getConnection();
						sql = "SELECT title,hits,qnum FROM in_question WHERE hits=(SELECT MAX(hits) FROM in_question)"; //내공 가장많은 아이디
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						if(rs.next())
						bean.setTitle(rs.getString("title"));
						bean.setHits(rs.getInt("hits"));
						bean.setQnum(rs.getInt("qnum"));
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return bean;
				}
				//내공가장 많은 질문
				public QuestionBean pointq(){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					QuestionBean bean = new QuestionBean();
					try {
						con = pool.getConnection();
						sql = "SELECT title,point,qnum FROM in_question WHERE point=(SELECT MAX(point) FROM in_question)"; //내공 가장많은 아이디
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						if(rs.next())
						bean.setTitle(rs.getString("title"));
						bean.setPoint(rs.getInt("point"));
						bean.setQnum(rs.getInt("qnum"));
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return bean;
				}
				
				//답변수 가장 많은 질문
				public QuestionBean answerq(){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					QuestionBean bean = new QuestionBean();
					try {
						con = pool.getConnection();
						sql = "SELECT title,answer_count,qnum FROM in_question WHERE answer_count=(SELECT MAX(answer_count) FROM in_question)"; //내공 가장많은 아이디
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						if(rs.next())
						bean.setTitle(rs.getString("title"));
						bean.setAnswer_count(rs.getInt("answer_count"));
						bean.setQnum(rs.getInt("qnum"));
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return bean;
				}
}
