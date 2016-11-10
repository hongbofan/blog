package red.bofan.util;


import java.io.Serializable;
import java.util.List;

public class PaginationVo<T> implements Serializable{

	//页码
	private int pageNum;
	//页数
	private int pageCount;
	//数量
	private int count;
	//起始位置
	private int offset;
	//分页大小
	private int rows;
	//获取的VO数据
	private List<T> list;

	public int getPageNum() {
		return pageNum;
	}
	//一定要在setPageCount()方法之后执行这条语句
	public void setPageNum(int pageNum) {
		if (pageNum <= 0) {
			this.pageNum = 1;
		} else if(pageNum>pageCount){
			this.pageNum = pageCount;
		}else{
			this.pageNum=pageNum;
		}
        //防止报错
        if (this.pageNum==0){
            this.pageNum = 1 ;
        }
    }
	public int getPageCount() {
		return pageCount;
	}
	//通过count数量计算页数
	public void setPageCount() {
		if(this.getCount()%this.getRows()==0){
			this.pageCount=this.getCount()/this.getRows();
		}else{
			this.pageCount=this.getCount()/this.getRows()+1;
		}
	}
	public int getCount() {
		return count;
	}
	//通过外部数据库获取
	public void setCount(int count) {
		this.count = count;
	}
	public int getOffset() {
		this.setOffset();
        return offset;
	}
	//计算起始位置
	public void setOffset() {
		this.offset =this.getRows()*(this.getPageNum()-1);
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
		this.setPageCount();
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
}
