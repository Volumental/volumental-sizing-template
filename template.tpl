___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "categories": ["UTILITY"],
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Volumental Sizing Template",
  "brand": {
    "id": "brand_dummy",
    "displayName": "",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFgAAABYCAYAAABxlTA0AAAD5klEQVR4Ae2agU3rMBRF3a8/AGwAE8AIMAEwATABMAEwATABMAEwAWwATAAbwAbGt9KLXtxQnLTXbaV7pPzfJI4Tn9iO/cwoJoKg8S8IKhJMRoLJSDAZCSYjwWQkmIwEk5FgMhJMRoLJSDAZCSYjwWQkmIwEk5FgMhJMRoLJSDAZCSYjwWQkmIwEk5FgMhJMRoLJSDCZpRf8+fkZRqNRs2F/lVANJiPBZKoIRrP+/v4ONXh5eQm7u7thfX296Vawf39/HxZCrMDFxUXc2NiIR0dH8ePjo8+l4/R4TNumXY/7+LT5tr29Hb++vmJNqgn2Bd3Z2YkPDw9F15YKvr29nbjH6elp3N/fbx3Hfk2qCM4Lbxtq9d3d3dRaWSoYefl8PRBd2grmTRXBAIVCQb0Iv/3WfZQIfn19baXBC/WgW/Dnr6+vYy2qCfY8Pz+Pha6trU2IxkvwlAh+fHxspUH+Of5euHctFjJMS/1jSLUsJFnj/9PHpzn39vYW+pJqaGs/tZKJNElw87vWiAYsdBwMmU9PT9VnZzUF/w+VMampH5woKGqZr81DwQvLa7G/1zzuUUoVwSgcBvqprxxPBHIg9uTkJKT+t9WUS0GX43l/f28dw0v1gre2tkI1YgV+mwBgrNr1QfKUDtOQV3DDNJ8OH7WSPBhUF4yvOUYKGFqVUCoYLypkY2xIz4eF5+fnsSbVBKOwV1dXvaeqfabKyD9MmSqnbijWZoR/Ahn0f0P6VoAP1ubmZrOPoV3XMMynv7m5afpd+3Du7e1N9NU1qCJ4FvoKXjYUDyZTfRw8hFWqsTlL30WsOuoiyEgwGQkmI8FkBgs+ODhoAihnZ2fNb4xbcQ7b8fFxK8iCdHloEscsBmwTBMOvBuM67PvrsW+bHcf9/D5+G3iermss7zwQhfQzEweCeIKtp2Ea7I9jymq/MU02kC6f6vqAD4IyPviDuAVWgu0c9v31+dobwHmks2fKi4jlpHxFA8eQV76a0pV/XwbXYEw9Lfx4eHjYHEcNtCkp0swSTMc0N60Ch8vLy3E+eRwXtRW1LK9puA7PgBZRAlpJWuUel2feDBaMAti838/xIcGaOeKyf00ScN66ka6VBsSJEZz3L9GASCw5Yeu6LrWw8Bcog5UDdMWrZyLOALqC/O8MrMtA0867BDRNHPPHEbb06T22b39Dka88W0jS5+e7LHQ3eTNHXj6qhn1bhUZ6H860vPPn6oNmcmQ0TCMjwWQkmIwEk5FgMhJMRoLJSDAZCSYjwWQkmIwEk5FgMhJMRoLJSDAZCSYjwWQkmIwEk5FgMhJMRoLJSDAZCSYjwWQkmIwEk/kB+YzHfyf9MZMAAAAASUVORK5CYII\u003d"
  },
  "description": "Fast and easy integration of the Volumental Sizing Widget.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "vol_token",
    "displayName": "Volumental Token",
    "simpleValueType": true,
    "help": "Your unique Volumental Token that has been provided to you from Volumental."
  },
  {
    "type": "TEXT",
    "name": "productId",
    "displayName": "Product SKU",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const log = require('logToConsole');
const injectScript = require('injectScript');
const queryPermission = require('queryPermission');
const callInWindow = require('callInWindow');
const getType = require('getType');

// Pick the correct url depending on if we are in dev or not.
let url = "https://widget.volumental.dev/embed.js";
if (!data.dev) {
  url = "https://widget.volumental.com/embed.js";
}

// Make sure we have the permissions to inject the volumental script.
if (!queryPermission('inject_script', url)) {
  log("missing permission to inject volumental embed script");
  data.gtmOnFailure();
  return;
}

// Make sure we have the permissions to execute the volumental script.
if (!queryPermission('access_globals', 'execute', 'volumental.Widgets.RecommendationButton')) {
  log("missing permission to execute volumental embed script");
  data.gtmOnFailure();
  return;
}

// Inject the script and execute onload.
injectScript(
  url,
  () => {
    log('script loaded, executing');
    var call = callInWindow('volumental.Widgets.RecommendationButton', {
      container: 'volumental-sizing-container',
      token: data.vol_token,
      productId: data.productId,
    });
    
    data.gtmOnSuccess();
  },
  () => {
    log('failed to inject volumental script');
    data.gtmOnFailure();
  }
);


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "volumental.Widgets.RecommendationButton"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://widget.volumental.dev/embed.js"
              },
              {
                "type": 1,
                "string": "https://widget.volumental.com/embed.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 15/08/2023, 13:36:09


