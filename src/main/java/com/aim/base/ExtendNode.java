package com.aim.base;

import java.util.List;

/**
 * @Author AIM
 * @Des 集成的节点
 * @DATE 2019/12/4
 */
public interface ExtendNode<T> {

	boolean isChildFrom(T node);

	boolean isBrother(T node);

	void addChildNode(T node);

	List<T> getChildNodes();
}
