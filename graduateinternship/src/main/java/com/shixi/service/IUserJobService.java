package com.shixi.service;

import java.util.List;
import java.util.Map;

import com.shixi.entity.UserWithJob;
import com.shixi.entity.vo.CompanyVO;
import com.shixi.entity.vo.UserJobVO;

/**
 * @Description: 用户岗位service接口
 * @author: hw
 * @date: 2018年3月27日 下午5:01:16
 */
public interface IUserJobService {
	int deleteByPrimaryKey(Integer id);

	int insert(UserWithJob record);

	int insertSelective(UserWithJob record);

	UserWithJob selectByPrimaryKey(Integer id);

	UserWithJob selectByuidjid(Map map);
	List<UserWithJob> selectByuid(Map map);
	Long selectByuidCounts(Map map);

	int updateByPrimaryKeySelective(UserWithJob record);

	int updateByPrimaryKey(UserWithJob record);

	List<UserJobVO> findAscUserJobs(Map<String, Object> map);

	List<UserJobVO> findAscUserJobsWithSuccess(Map<String, Object> map);
	
	Long getTotlaAscUserJobs(Map<String,Object> map);

	Long getTotlaAscUserJobsWithSuccess(Map<String,Object> map);

	List<UserJobVO> findAscUserJobsByUserid(Map<String, Object> map);


	List<UserJobVO> findAscUserJobsWithUserid(Map<String,Object> map);
	Long getTotlaAscUserJobsWithuser(Map<String,Object> map);

}
