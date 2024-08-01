
# 待办目标

- PS5
- 抢票程序
- 博客
- jasper

-在使用jasper7.0.0的时候遇到了问题，
我的项目是springboot3.3.0，jdk17，jasperreports7.0.0的一个账单生成pdf的项目。
在通过打成jar包运行java -jar的时候，访问接口发生了500错误，pdf无法正常访问，报错的位置是在 JasperCompileManager.compileReport(new ClassPathResource("bill_template.jrxml").getInputStream());
错误的log是[net.sf.jasperreports.engine.JRException: Errors were encountered when compiling report expressions class file:
D:\Source\blcloud-domain-package\jasper-report\bill_template_a39197dee8093438604f29bf3cc4cf42b6c8714f6959a76525c0d574abdfdde9.java:18: error: cannot find symbol
public class bill_template_a39197dee8093438604f29bf3cc4cf42b6c8714f6959a76525c0d574abdfdde9 extends JREvaluator
symbol: class JREvaluator
D:\Source\blcloud-domain-package\jasper-report\bill_template_a39197dee8093438604f29bf3cc4cf42b6c8714f6959a76525c0d574abdfdde9.java:25: error: cannot find symbol
private JRFillVariable variable_totalAmount = null;
symbol:   class JRFillVariable
location: class bill_template_a39197dee8093438604f29bf3cc4cf42b6c8714f6959a76525c0d574abdfdde9
D:\Source\blcloud-domain-package\jasper-report\bill_template_a39197dee8093438604f29bf3cc4cf42b6c8714f6959a76525c0d574abdfdde9.java:4: error: package net.sf.jasperreports.engine does not exist
import net.sf.jasperreports.engine.*;
D:\Source\blcloud-domain-package\jasper-report\bill_template_a39197dee8093438604f29bf3cc4cf42b6c8714f6959a76525c0d574abdfdde9.java:5: error: package net.sf.jasperreports.engine.fill does not exist
import net.sf.jasperreports.engine.fill.*;
D:\Source\blcloud-domain-package\jasper-report\bill_template_a39197dee8093438604f29bf3cc4cf42b6c8714f6959a76525c0d574abdfdde9.java:64: error: cannot find symbol
variable_totalAmount = (JRFillVariable)vm.get("totalAmount");
symbol:   class JRFillVariable
location: class bill_template_a39197dee8093438604f29bf3cc4cf42b6c8714f6959a76525c0d574abdfdde9
5 errors at net.sf.jasperreports.engine.design.JRAbstractCompiler.compileReport(JRAbstractCompiler.java:234)
]
我的pom中已经导入了相关的依赖
 <dependency>
    <groupId>net.sf.jasperreports</groupId>
    <artifactId>jasperreports</artifactId>
    <version>7.0.0</version>
</dependency>
<dependency>
    <groupId>net.sf.jasperreports</groupId>
    <artifactId>jasperreports-pdf</artifactId>
    <version>7.0.0</version>
</dependency>
<dependency>
    <groupId>net.sf.jasperreports</groupId>
    <artifactId>jasperreports-fonts</artifactId>
    <version>7.0.0</version>
</dependency>

pom的打包配置
<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <version>3.11.0</version>
            <configuration>
                <source>${java.version}</source>
                <target>${java.version}</target>
                <encoding>${project.build.sourceEncoding}</encoding>
            </configuration>
        </plugin>
        <plugin>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-maven-plugin</artifactId>
            <executions>
                <execution>
                    <goals>
                        <goal>repackage</goal>
                    </goals>
                </execution>
            </executions>
        </plugin>
    </plugins>
</build>

请注意，这个项目在使用mvn spring-boot:run或者直接运行springboot的main方法都是能正常的，能访问到生成的pdf内容
只有当jar包运行方式时出现了问题，我在生成的jar包内能正常找到我的jrxml模板文件，且依赖的jar也在BOOT-INF\lib下面
请分析错误的原因并提出解决方案
