package in;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class TagMgr {

	private DBConnectionMgr pool;
	
	public TagMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//�±����� ��������
	public Vector<TagBean> getTag(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<TagBean> vlist = new Vector<TagBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM tagname limit 110000";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				TagBean bean = new TagBean();
				bean.setTag(rs.getString("tag"));
				bean.setTagInfo(rs.getString("tagInfo"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
}
