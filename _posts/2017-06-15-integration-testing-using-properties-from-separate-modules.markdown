---

layout: post
title:  "[Java][Spring] Integration Testing module using properties from Tested Modules"
date:   2017-06-15 19:00:00 +0300
categories: tech, java, spring
---

The following versions were used in this post:
* **Java 1.8**
* **[Spring Boot Autoconfigure][spring-boot-app]{:target="_blank"} 1.3.7.RELEASE**
* **[Spring TestContext][spring-boot-test]{:target="_blank"} 4.2.7.RELEASE**

Suppose we have a Java Spring-framework based project named **"zoo-app"**, which has unit tests and integration tests in its app module.

![zoo-app-01]

{% highlight java %}
  @SpringBootApplication
  public class ZooApp {
      public static void main(String[] args) {
          SpringApplication.run(ZooApp.class);
      }
  }
{% endhighlight %}

Now, we want to extract the integration tests from **"zoo-app"** into a separate module, named **"zoo-integrationtests"** and still use the application.properties from **"zoo-app"**.

By default, the test searches for properties in its own module (**"zoo-integrationtests"***), which will be the **test.properties** file and **not the application.properties** file from the tested module (**"zoo-app"**).

![zoo-app-02]

Given this situation, the solution to use the **application.properties** file and the properties contained in the integration test is the simple addition of **initializers = ConfigFileApplicationContextInitializer.class** in the **@ContextConfiguration** annotation of the Test class:

{% highlight java %}
@ContextConfiguration(
  initializers = ConfigFileApplicationContextInitializer.class,
  classes = {ZooApp.class})
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class ZooAppIntegrationTest {

  @Test
  public void testZooAppIntegration() {
    // some integration tests here
  }
}
{% endhighlight %}

With this class referenced in the @ContextConfiguration, the integration test uses the **application.properties** file from the application referenced in the **classes** field, in this case only **"ZooApp"**.

Answer also featured on stackoverflow: **[link1][answer-on-stackoverflow01] [link2][answer-on-stackoverflow02]**.


[spring-boot-app]: https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-autoconfigure/1.3.7.RELEASE
[spring-boot-test]: https://mvnrepository.com/artifact/org.springframework/spring-test/4.2.7.RELEASE

[zoo-app-01]: https://lh3.googleusercontent.com/hrCyXdLKg9HW1PkLRcUGTGB7lHDfwnYMLNKrSEo2Ax44vhEtkqlEjrT-RKsOcWRZlqx9E9edmlHgPDe8JDKat_EIxIf-3N6MXgOrDNGs6udPDLZVQTl2R-alQ7mkO-37XnKIrKFsqXIChhMqdEHVRw3eo3zCEmKEYkNSElj1TqRwv7R1u_OL5vDWvttaloG7ZRCLezdG5EONpYOJeWbvtRH-8PxksiS9XGaTZLdsXriNoA3fmILY2B2ZMzHuODL5r0Mi8wE_1mdUdH2pedyDgKKKIxzuRzfHG2pQTNXPLpspZuN5EA0MaTA1x9TSJuH6k_EN2j0CKtkEEqNw-S1nj7pOXATA_A7s-CR_-Q8AAdbEczibjd3fzkxU6hW1TSIAoVxP7iNpSG3LG2V_81epQeGra8W5QpmfdInoXBGJrirrDEyMh07Z8qGDS4-5T5gnBmOBxTCjPXaASDX3T3uj7BwyZJZopWBM_AL7zuZ7QyjiKZ0GoeUBOVtlCrVv_DrIXaBX_jg2oSom1RhOIyOBoDirb5oXuFBoeK1O1EQaYobm-RrHRRvWDt2D3vckviOwqve3tdxnYhfjmugSKYHaxwD8jJR0iI57GTxYmlJ525zwaOvScNc=w467-h221-no

[zoo-app-02]: https://lh3.googleusercontent.com/q9PyO5hXnirE7zAYKxbEtiPpJZzjwPu8zinINciNgkvSl--9o5rm56M2oxTb35OaLgh2Max4qyfVmCUnULImi4yrmTmN2RYBW4yClatrqg0wl49BXkYwYWRSXp43hvE_hWqqYLdmhIiSydDMY1kcmRCQDD-vG6kOpKTEx_BXksg3S43aGYCrWkQvl7DuDZPikdvneliFNersvdChG0Aro0SmSWxBEE6aoPaxiQBUgVFnlOOl7cNk8nQUsDsxtaL6NE-iI0uwRHIizBqKmxaWU5RDLFRkcT8xivJ9JhupNQNQakPuBjqFHshZLvHeFrhZEyiXjVEnkmrAWqnat_LFXX8OqXt_5YJ1iq28iHXFqNCApA7O35cf3FXcWt2tjyHScH33gKTv1tn3OW8Vn8KBkOwB1zlXTIzbvVY-lr9lZmoo9c6LsCzugbgopyK6sK5SWbM7gbe1irq3DkOwTlAH98tGT9FcWM6KIp0_kmami6GZIK_RuvaiElQ54kyaAz-J-Vgw-Ey0XxLmNHYomuxIl1vKa6nTjHgoNWJ6LhWMUKRM38MMdf8ZvXf2MqM3R7v5XUe2ki9sKIxG32V6GtlHB8GwhzlEGxZaa-VMQMW-Wt-8xsuOLVo=w469-h301-no

[answer-on-stackoverflow01]: https://stackoverflow.com/a/44572760/2633378
[answer-on-stackoverflow02]: https://stackoverflow.com/a/26840503/2633378
