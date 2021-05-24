class AppStorage {
    store(data) {
        this.storeData(data);
    }
    storeData(data) {
        localStorage.setItem('loggedAdmin', true);
        localStorage.setItem('admin', JSON.stringify(data));
    }
    clear() {
        localStorage.removeItem('loggedAdmin')
        localStorage.removeItem('admin')
    }
    getAdmin() {
        if (localStorage.getItem('admin')) {
            try {
                return JSON.parse(localStorage.getItem('admin'));
            } catch (e) {
                return [];
            }
        }
    }
    logged() {
        return localStorage.getItem('loggedAdmin')
    }
}

export default AppStorage = new AppStorage()
