package team.blog.po;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Article entity. @author MyEclipse Persistence Tools
 */

public class Article implements java.io.Serializable {

	// Fields

	private Integer id;
	private String type;
	private String content;
	private Timestamp date;
	private Integer clickhit;
	private Integer replyhit;
	private Integer likehit;
	private String title;
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	private Set comments = new HashSet(0);

	// Constructors

	/** default constructor */
	public Article() {
	}

	/** full constructor */
	public Article(String type, String content, Timestamp date,
			Integer clickhit, Integer replyhit, Integer likehit, Set comments) {
		this.type = type;
		this.content = content;
		this.date = date;
		this.clickhit = clickhit;
		this.replyhit = replyhit;
		this.likehit = likehit;
		this.comments = comments;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public Integer getClickhit() {
		return this.clickhit;
	}

	public void setClickhit(Integer clickhit) {
		this.clickhit = clickhit;
	}

	public Integer getReplyhit() {
		return this.replyhit;
	}

	public void setReplyhit(Integer replyhit) {
		this.replyhit = replyhit;
	}

	public Integer getLikehit() {
		return this.likehit;
	}

	public void setLikehit(Integer likehit) {
		this.likehit = likehit;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}

}