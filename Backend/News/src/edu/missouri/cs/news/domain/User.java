package edu.missouri.cs.news.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户的模型 
 * author LSY
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	// 用户的email地址
	private String email;
	// 用户的id
	private String id;
	// 用户密码的散列值
	private String password;
	// 用户的类型
	private Byte type;
}
