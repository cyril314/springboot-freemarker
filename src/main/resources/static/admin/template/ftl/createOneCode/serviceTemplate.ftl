package com.aim.service.${packageName};

import com.aim.base.IService;
import com.aim.mapper.master.db.${objectName}Mapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/** 
 *  ${TITLE}接口实现类
 */
@Service
@Transactional
public class ${objectName}Service extends IService<${objectName}Mapper> {

	@Autowired
	private ${objectName}Mapper ${objectNameLower}Mapper;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		${objectNameLower}Mapper.save(pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		${objectNameLower}Mapper.delete(pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		${objectNameLower}Mapper.edit(pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception{
		return ${objectNameLower}Mapper.datalistPage(page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception{
		return ${objectNameLower}Mapper.listAll(pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return ${objectNameLower}Mapper.findById(pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		${objectNameLower}Mapper.deleteAll(ArrayDATA_IDS);
	}
	
}

