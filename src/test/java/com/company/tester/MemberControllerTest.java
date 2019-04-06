package com.company.tester;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
 
import java.nio.charset.Charset;
 
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.company.controller.MemberController;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"test-config.xml"})
public class MemberControllerTest {
	
	@Autowired
	MemberController memberController;
	
	private MockMvc mockMvc;
	
	private MediaType contentType = new MediaType(MediaType.APPLICATION_JSON.getType(),
	           MediaType.APPLICATION_JSON.getSubtype(),
	          Charset.forName("utf8"));
	
	@Before
    public void setUp() throws Exception {
         mockMvc = MockMvcBuilders.standaloneSetup(memberController).build();
    }

	@Test
	public void testMemberController() throws Exception {
		mockMvc.perform(post("member/loginPOST").param("email_id", "spring@gmail.com")).andExpect(status().isOk());
	}
	
	
}