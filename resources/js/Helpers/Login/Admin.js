import AppStorage from './AdminAppStroage'
class Admin {
    login(data) {
        AppStorage.store(data);
    }
    loggedIn() {
        return AppStorage.logged();
    }
    name() {
        if (this.loggedIn()) {
            if (AppStorage.getAdmin()) {
                return AppStorage.getAdmin()['name'];
            } else {
                return "";
            }
        }
    }
    username() {
        if (this.loggedIn()) {
            if (AppStorage.getAdmin()) {
                return AppStorage.getAdmin()['username'];
            } else {
                return "";
            }
        }
    }
    role() {
        if (this.loggedIn()) {
            if (AppStorage.getAdmin()) {
                return AppStorage.getAdmin()['role'];
            } else {
                return "";
            }
        }
    }
    id() {
        if (this.loggedIn()) {
            if (AppStorage.getAdmin()) {
                return AppStorage.getAdmin()['id'];
            } else {
                return "";
            }
        }
    }
    logout() {
        axios.get("/logout").then(res => {
            AppStorage.clear();
            window.location = laravel.baseurl + '/admin/loginme'
        }).catch(error => console.log(error));
    }
}

export default Admin = new Admin();
