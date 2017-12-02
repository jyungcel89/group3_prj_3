package kr.co.sist.vo;

public class Paging {
    private int pageSize;
    private int pageBlock;
    private int pageNo;
    private int totalCount;
    
    private int startRowNo;
    private int endRowNo;
    
    private int firstPageNo;
    private int finalPageNo;
    
    private int prevPageNo;
	private int nextPageNo;
	
    private int startPageNo;
    private int endPageNo;
    
    private String searchCondition;
    private String searchValue;
    
    public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		this.makePaging();
	}
	public int getStartRowNo() {
		return startRowNo;
	}
	public void setStartRowNo(int startRowNo) {
		this.startRowNo = startRowNo;
	}
	public int getEndRowNo() {
		return endRowNo;
	}
	public void setEndRowNo(int endRowNo) {
		this.endRowNo = endRowNo;
	}
	public int getFirstPageNo() {
		return firstPageNo;
	}
	public void setFirstPageNo(int firstPageNo) {
		this.firstPageNo = firstPageNo;
	}
	public int getFinalPageNo() {
		return finalPageNo;
	}
	public void setFinalPageNo(int finalPageNo) {
		this.finalPageNo = finalPageNo;
	}
	public int getPrevPageNo() {
		return prevPageNo;
	}
	public void setPrevPageNo(int prevPageNo) {
		this.prevPageNo = prevPageNo;
	}
	public int getNextPageNo() {
		return nextPageNo;
	}
	public void setNextPageNo(int nextPageNo) {
		this.nextPageNo = nextPageNo;
	}
	public int getStartPageNo() {
		return startPageNo;
	}
	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}
	public int getEndPageNo() {
		return endPageNo;
	}
	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}

    private void makePaging(){
    	/////////////////////////�⺻ �� ����///////////////////////////
    	if( this.totalCount == 0 ){ return; }
    	if( this.pageNo == 0 ){ this.setPageNo(1); }
    	if( this.pageSize == 0 ){ this.setPageSize(5); }
    	if( this.pageBlock == 0 ){ this.setPageBlock(5); }
    	
    	
    	//////////////////////// [ù ������] ................ [������������] ��� ///////////////////////////
    	int finalPage = ( totalCount + ( pageSize - 1 ) ) / pageSize;
    	this.setFirstPageNo(1);
    	this.setFinalPageNo( finalPage );
    	
    	//////////////////////// [����], [���� ������ ���] ///////////////////////////
        boolean isNowFirst = pageNo == 1 ? true : false;
        boolean isNowFinal = pageNo == finalPage ? true : false;
        if (isNowFirst) {
            this.setPrevPageNo(1);
        } else {
            this.setPrevPageNo(((pageNo - 1) < 1 ? 1 : (pageNo - 1)));
        }//end if
        if (isNowFinal) {
            this.setNextPageNo(finalPage);
        } else {
            this.setNextPageNo(((pageNo + 1) > finalPage ? finalPage : (pageNo + 1)));
        }//end if
        
		///////////////////////////// ����¡ �׺�[���]�� ��� /////////////////////////////
		int startPage = ((pageNo - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		// ����¡ �׺� ���� [20-30] �ε� ������ �������� 28 �� ��� 
		// [29, 30] �������� ����¡ �׺� �̳��� �ؾ� �Ѵ�.
		if (endPage > finalPage) {
		    endPage = finalPage;  
		}//end if
		this.setStartPageNo(startPage);
		this.setEndPageNo(endPage);
		
		//////////////////////////// ��ȸ ���� row, ��ȸ ������ row ��� //////////////////////////
		int startRowNo = ( (pageNo-1) * pageSize ) + 1;
		int endRowNo = pageNo * pageSize; 
		setStartRowNo( startRowNo );
		setEndRowNo( endRowNo );
    }
	@Override
	public String toString() {
		return "Paging [pageSize=" + pageSize + ", pageBlock=" + pageBlock + ", pageNo=" + pageNo + ", totalCount="
				+ totalCount + ", startRowNo=" + startRowNo + ", endRowNo=" + endRowNo + ", firstPageNo=" + firstPageNo
				+ ", finalPageNo=" + finalPageNo + ", prevPageNo=" + prevPageNo + ", nextPageNo=" + nextPageNo
				+ ", startPageNo=" + startPageNo + ", endPageNo=" + endPageNo + ", searchCondition=" + searchCondition
				+ ", searchValue=" + searchValue + "]";
	}
    
    

}
