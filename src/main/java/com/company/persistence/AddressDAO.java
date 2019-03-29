package com.company.persistence;

import com.company.domain.AddressVO;

public interface AddressDAO {
	public void insertAddress(AddressVO addressVO) throws Exception;
	public Integer getAddressNo(String goods_address) throws Exception;
}
