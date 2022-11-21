# Integration-Test
## _Description_
This repos implement tests cases that verify the interactions between the modules of a software system and ensure that all sub-systems(BO, OCA,CIS,..) are functioning properly.(usinig big ban approch)

## Packages & Directory structure

- Each folder name identify which sub-systems(OCA, CIS,.).
- In the folder hierarchy we find all files .feature, a runner and folder datas include files .json.
- Folder helpers include all call api(get, post, delete) that can be shared by all sub-system.
- karate-config.js set up all global variables.

## Run tests
 Using ide Intellij 
 click on the green arrow button 
 ![image](https://user-images.githubusercontent.com/87689883/203014548-57cd2863-830b-4aca-8dcd-2f7b8203f32b.png)

 Using gradle
```sh
./gradlew test "-Dtest=ApiZeltyDispoRunner" "-Dkarate.env=staging"
```
