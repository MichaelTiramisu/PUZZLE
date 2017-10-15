package edu.missouri.cs.news.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class News {
	private Integer id;
	private Integer typeId;
	private String title;
	private String author;
	private Long time;
	private String content;
	private String imageUrl;
}
