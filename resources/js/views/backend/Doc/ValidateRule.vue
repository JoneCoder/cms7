<template>
  <div>
    <pre> {{ validation.allErrors() }} </pre>
  </div>
</template>

<script>
export default {
  // ================== validation rule for form ==================
  validators: {
    // all validation rule
    "data.title": function(value = null) {
      let vm = this;
      return Validator.value(value)
        .required("Title is required")
        .email()
        .digit()
        .url()
        .minLength(11)
        .maxLength(15)
        .custom(function() {
          // custom condition
          if (value == "ABC") {
            return "ABC";
          }
        })
        .custom(function() {
          if (!Validator.isEmpty(value)) {
            var wid, high;
            var _URL = window.URL || window.webkitURL;
            $("#org_image1").change(function(e) {
              var file, img;
              if ((file = this.files[0])) {
                img = new Image();
                img.onload = function() {
                  wid = this.width;
                  high = this.height;
                };
                img.src = _URL.createObjectURL(file);
              }
            });

            return Promise.delay(500).then(function() {
              //  console.log("asd="+wid+",  ada="+high);
              if (wid != undefined && high != undefined) {
                if (wid != 300 || high != 350) {
                  return "image must be width:300px x height:350px";
                }
              }
            });
          }
        });
    },

    // mobile number validation
    "data.mobile": function(value = null) {
      return Validator.value(value)
        .required("Mobile is required")
        .digit()
        .regex("01+[0-9+-]*$", "Must start with 01.")
        .minLength(11)
        .maxLength(15);
    },

    // only character
    "data.name": function(value = null) {
      return Validator.value(value)
        .required("Name is required")
        .minLength(2)
        .regex("^[a-zA-Z_ ]*$", "Must only contain alphabetic characters.");
    },

    // file type and size
    "data.title": function(value = null) {
      return Validator.value(value)
        .required("Title is required")
        .custom(function() {
          if (!Validator.isEmpty(value)) {
            var type = value.type;
            if (type == "application/pdf") {
            } else {
              return "PDF format required";
            }
          }
        })
        .custom(function() {
          if (!Validator.isEmpty(value)) {
            var size = value.size;
            if (size > 512000) {
              return "Pdf must be smaller than 500kb";
            }
          }
        })
        .custom(function() {
          if (!Validator.isEmpty(value)) {
            var type = value.type;
            if (type == "image/jpeg" || type == "image/png") {
            } else {
              return "Image must be of type .jpg or .png";
            }
          }
        });
    },

    // with real time check from database
    "data.model": function(value = null) {
      return Validator.value(value)
        .required("Model Name is required")
        .custom(function() {
          if (!Validator.isEmpty(value)) {
            app.disabled = true;
            axios
              .get("/module/check-model", {
                params: { model: app.data.model_name }
              })
              .then(res => {
                if (res.data) {
                  app.model_exist = true;
                } else {
                  app.model_exist = false;
                }
              });
            return Promise.delay(1500).then(function() {
              if (app.model_exist) {
                return "Model name already exists";
              }
              app.disabled = false;
            });
          }
        });
    }
  }
};
</script>