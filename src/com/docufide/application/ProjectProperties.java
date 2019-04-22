/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docufide.application;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 *
 * @author marina.vasilenko
 */
public class ProjectProperties {
    private String projectPath = "D:\\svn.docufide.com\\transformation-service-api-stylesheet";
    private String stylesheetPath = "\\src\\main\\resources\\com\\parchment\\transformation\\api\\stylesheet";
    private String resourcesPath = "\\src\\test\\resources\\XSLFO";
    private String fopPath = "G:\\Work\\fop-2.2\\fop";
    private String workPath = "G:\\Temp\\inputfiles";
    private String launchesPath = "\\.settings";
    private static final String APPLICATION_ID = "AwardGenerator";
    private static final String PROPERTIES_FILE_NAME = "application.properties";
    private static final Properties APPLICATION_PROPERTIES = new Properties();
    
    public int loadProperties() {
        File file = new File(getApplicationDataDir().getAbsolutePath() + File.separator + PROPERTIES_FILE_NAME);
        if (file.exists()) {
            try (InputStream url = new FileInputStream(file)) {
                APPLICATION_PROPERTIES.load(url);
            } catch (IOException e) {
                System.out.println("Error loading application properties from file " + PROPERTIES_FILE_NAME);
                e.printStackTrace();
                return -1;
            }
            setProjectPath(APPLICATION_PROPERTIES.getProperty("projectPath"));
            setFopPath(APPLICATION_PROPERTIES.getProperty("fopPath"));
            setWorkPath(APPLICATION_PROPERTIES.getProperty("workPath"));
        } else {
            try {
                file.createNewFile();
                saveProperties();
            } catch (IOException e) {
                System.out.println("Cannot create file " + PROPERTIES_FILE_NAME);
                e.printStackTrace();
                return -1;
            }
        }
        return 0;
    }
    
    public int saveProperties() {
        File file = new File(getApplicationDataDir().getAbsolutePath() + File.separator + PROPERTIES_FILE_NAME);
        try (FileWriter propertiesStream = new FileWriter(file)) {
            APPLICATION_PROPERTIES.setProperty("projectPath", getProjectPath());
            APPLICATION_PROPERTIES.setProperty("fopPath", getFopPath());
            APPLICATION_PROPERTIES.setProperty("workPath", getWorkPath());
            APPLICATION_PROPERTIES.store(propertiesStream, null);
        } catch (IOException e) {
            System.out.println("Error storing application properties to file " + PROPERTIES_FILE_NAME);
            e.printStackTrace();
            return -1;
        }
        return 0;
    }
    
    public static File getApplicationDataDir() {
            String applicationDataRootDirPath = System.getenv("APPDATA");
            if (applicationDataRootDirPath == null || applicationDataRootDirPath.isEmpty()) {
                    applicationDataRootDirPath = System.getProperty("user.home") + File.separator + "Local Settings" + File.separator + "ApplicationData";
            }

            File applicationDataDir = new File(applicationDataRootDirPath + File.separator + APPLICATION_ID);
            if (!applicationDataDir.exists()) {
                    applicationDataDir.mkdirs();
            }

            return applicationDataDir;
    }
    
    public void setProjectPath (String projectPath) {
        this.projectPath = projectPath;
    }
    
    public String getProjectPath () {
        return this.projectPath;
    }
    
    private void setLaunchesPath(String workspacePath) {
        this.launchesPath = workspacePath;
    }
    
    public String getLaunchesPath() {
        return this.projectPath + this.launchesPath;
    }

    private void setStylesheetPath(String stylesheetPath) {
        this.stylesheetPath = stylesheetPath;
    }

    private void setResourcesPath(String resourcesPath) {
        this.resourcesPath = resourcesPath;
    }

    public String getStylesheetPath() {
        return this.projectPath + stylesheetPath;
    }

    public String getResourcesPath() {
        return this.projectPath + resourcesPath;
    }
    
    public String getFopPath() {
        return fopPath;
    }
    
    public void setFopPath(String fopPath) {
        this.fopPath = fopPath;
    }
    
    public String getWorkPath() {
        return workPath;
    }
    
    public void setWorkPath(String workPath) {
        this.workPath = workPath;
    }
    
    
}
