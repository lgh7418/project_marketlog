package com.company.persistence;

import java.util.List;

import com.company.domain.AddressVO;

public interface AddressDAO {
	public void insertAddress(AddressVO addressVO) throws Exception;
	public AddressVO getAddressNo(String goods_address) throws Exception;
	public List<AddressVO> selectAddressList(int member_no) throws Exception; 
	public AddressVO selectAddress(int address_no) throws Exception; 
}
