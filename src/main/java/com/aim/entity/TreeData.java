package com.aim.entity;

import com.aim.base.ExtendNode;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author AIM
 * @Des 菜单树
 * @DATE 2019/12/3
 */
public class TreeData implements ExtendNode<TreeData> {

	private String id;             // 主键ID
	private String pid;            // 上级ID
	private String title;           // 菜单名
	private String href;            // 访问路径
	private String fontFamily;      // 图标系列
	private String icon;            // 展示图标
	private boolean spread = false; // 是否展开
	private boolean isCheck = false;// 是否选中
	private List<TreeData> children = new ArrayList<TreeData>();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getFontFamily() {
		return fontFamily;
	}

	public void setFontFamily(String fontFamily) {
		this.fontFamily = fontFamily;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public boolean isSpread() {
		return spread;
	}

	public void setSpread(boolean spread) {
		this.spread = spread;
	}

	public boolean isCheck() {
		return isCheck;
	}

	public void setCheck(boolean check) {
		isCheck = check;
	}

	public List<TreeData> getChildren() {
		return children;
	}

	public void setChildren(List<TreeData> children) {
		this.children = children;
	}

	@Override
	public boolean isChildFrom(TreeData node) {
		return this.pid.equals(node.getId());
	}

	@Override
	public boolean isBrother(TreeData node) {
		return this.pid.equals(node.getPid());
	}

	@Override
	public void addChildNode(TreeData node) {
		if (children == null) {
			children = new ArrayList<TreeData>();
		}
		children.add(node);
	}

	@Override
	public List<TreeData> getChildNodes() {
		return this.children;
	}
}
