![Screenshot][logo]
# Kasm Workspaces Data Science Desktop Environment

This project provides a desktop environment geared for data science. It is meant as an example to using DevOps to provide a secure working environment for data science using the Kasm Workspaces platform.

Kasm Workspaces is a container streaming platform that provides browser-based access to desktops, applications, and web services. Kasm uses a modern DevSecOps approach for programmatic delivery of services via Containerized Desktop Infrastructure (CDI) technology to create on-demand Docker containers that are accessible via web browser. The rendering of the graphical-based containers is powered by the open-source project  [**KasmVNC**](https://github.com/kasmtech/KasmVNC?utm_campaign=Dockerhub&utm_source=docker)

![Screenshot][Kasm_Workflow]

Kasm Workspaces was developed by a team of cybersecurity experts to meet the most demanding secure collaboration requirements.  Our solution makes use of the latest technology in DevOps to establish an architecture that is highly scalable, customizable, and easy to maintain.  Most importantly, Kasm provides a solution, rather than a service, so it is infinitely customizable to your unique requirements and includes a developer API so that it can be integrated with, rather than replace, your existing applications and workflows.

## Live Demo
A self-guided on-demand demo is available at [**kasmweb.com**](https://www.kasmweb.com/demo.html?utm_campaign=Dockerhub&utm_source=docker)


[**Workspaces**](https://www.kasmweb.com/kasm_server.html?utm_campaign=Dockerhub&utm_source=docker) can be deployed in the cloud (Public or Private), on-premise (Including Air-Gapped Networks), or in a hybrid configuration. Kasm also offers Workspaces as a fully managed SaaS. 

The Kasm team publishes applications and desktop images for use inside the platform. More information, including source can be found in the [Images Documentation](https://kasmweb.com/docs/latest/guide/custom_images.html?utm_campaign=Dockerhub&utm_source=docker)


{about}

# Manual Deployment

While this image is primarily built to run inside the Kasm platform, it can also be executed manually.  Please note that certain functionality, such as audio, is only available within the Kasm platform.

```
sudo docker run --rm  -it --shm-size=512m -p 6901:6901 -e VNC_PW=password kasmweb/<image>:<tag>
```

The container is now accessible via a browser : `https://<IP>:6901`

 - **User** : `kasm_user`
 - **Password**: `password`


# Tags

  - **[version-number]**
 
    Images are built and tagged along with the release of [**Kasm Workspaces**](https://www.kasmweb.com/index.html?utm_campaign=Dockerhub&utm_source=docker) (e.g `1.9.0`). Utilize the version that corresponds to your version of Kasm Server.

  - **[version-number]-rolling**
  
    **Rolling** tags are images that are updated and built nightly (e.g `1.9.0-rolling`). **Kasm Workspaces** administrators may consider using these **rolling** images to ensure their systems are always up to date. 

  - **develop**

     The **develop** tag is meant for testers and provides no expectation of compatibility with current release of **Kasm Workspaces**


# More Info

  - **Platform Documentation**
  
    [**Documentation**](https://kasmweb.com/docs/latest/index.html?utm_campaign=Dockerhub&utm_source=docker): Instructions for installing and configuring Kasm Workspaces

 
  - **Reporting Issues**

    [**BitBucket**](https://bitbucket.org/kasmtech/kasm_release/issues/?utm_campaign=Dockerhub&utm_source=docker): Report an issue with Kasm Workspaces


  - **Creating Custom Workspaces Images**
  
    [**Documentation**](https://kasmweb.com/docs/latest/how_to/building_images.html?utm_campaign=Dockerhub&utm_source=docker): Info on configuring custom images and installing software.
  
    [**BitBucket**](https://bitbucket.org/kasmtech/kasm_release/src/develop/?utm_campaign=Dockerhub&utm_source=docker):  Coding examples for creating custom images.
  
  - **KasmVNC**
  
    [**GitHub**](https://github.com/kasmtech/KasmVNC?utm_campaign=Dockerhub&utm_source=docker):  Kasm’s Open Source VNC server: browser-based, secure, high-performance.
    

[logo]: https://cdn2.hubspot.net/hubfs/5856039/dockerhub/kasm_logo.png "Kasm Logo"
[Kasm_Dashboard_2]: https://cdn2.hubspot.net/hubfs/5856039/dockerhub/kasm_server_2.png "Kasm Server Dashboard"
[Kasm_Dashboard_3]: https://cdn2.hubspot.net/hubfs/5856039/dockerhub/kasm_server_3.png "Kasm Server Dashboard2"
[Kasm_Kali]: https://cdn2.hubspot.net/hubfs/5856039/dockerhub/kali.png "Kasm Desktop"
[Kasm_Workflow]: https://cdn2.hubspot.net/hubfs/5856039/dockerhub/kasm_workflow_1440.gif "Kasm Workflow"
