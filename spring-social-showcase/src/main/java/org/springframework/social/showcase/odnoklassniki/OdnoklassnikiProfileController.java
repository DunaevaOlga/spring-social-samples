/*
 * Copyright 2016 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.springframework.social.showcase.odnoklassniki;

import com.vk.api.sdk.exceptions.ApiException;
import com.vk.api.sdk.exceptions.ClientException;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.odnoklassniki.api.Odnoklassniki;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;

@Controller
public class OdnoklassnikiProfileController {

	@Inject
	private ConnectionRepository connectionRepository;

	@RequestMapping(value="/odnoklassniki", method=RequestMethod.GET)
	public String home(Model model) throws ClientException, ApiException {
		Connection<Odnoklassniki> connection = connectionRepository.findPrimaryConnection(Odnoklassniki.class);
		if (connection == null) {
			return "redirect:/connect/odnoklassniki";
		}

		return "odnoklassniki/profile";
	}

}
