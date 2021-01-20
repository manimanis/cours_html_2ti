class Login {
  constructor(obj = {}) {
    this.login_id = +obj.login_id || 0;
    this.user_id = +obj.user_id || 0;
    this.nom_prenom = obj.nom_prenom || "";
    this.date_login = obj.date_login || "";
    this.date_expire = obj.date_expire || "";
    this.ip_addr = obj.ip_addr || "";
    this.granted = !!obj.granted;
  }
}
const app = new Vue({
  el: '#app',
  data: {
    mode: 'grant',
    logins: null,
    _selectAllRadio: false,
    selectedItems: []
  },
  mounted: function () {
    this.fetchLogins()
      .then(logins => {
        this.logins = Array(logins.length * 10).fill(0).map((v, i) => logins[i % logins.length]);
        this.selectAll(false);
      });
  },
  computed: {
    selectedItemsCount: function () {
      return this.selectedItems.reduce((pv, ci) => pv + +ci, 0);
    },
    selectedAllRadio: {
      get: function () {
        return this.logins.length == this.selectedItems.reduce((pv, ci) => pv + +ci, 0);
      },
      set: function (selected) {
        this.selectAll(selected);
      }
    }
  },
  methods: {
    /**
     * Return true in case of errors
     * @param {object} data 
     */
    handleDataErrors: function (data) {
      if (data.error) {
        this.error = true;
        this.errorMessage = data.messages;
      } else {
        this.error = false;
        this.errorMessage = '';
      }
      return this.error;
    },
    fetchLogins: function () {
      return fetch('manage.php?op=login_list')
        .then(response => response.json())
        .then(data => {
          if (!this.handleDataErrors(data)) {
            return data.data.logins.map(l => new Login(l));
          }
          return null;
        });
    },
    selectAll: function (selected) {
      this.selectedItems = this.logins.map((l, i) => selected);
    },
    selectItem: function (index, selected) {
      // this.selectedItems[index] = selected;
    },
    onSelectAllClicked: function () {
      this.selectAll(this.selectAllRadio);
    },
    onSelectItemClicked: function (index) {
      // this.selectItem(index, this.selectedItems[index]);
    },
    onGrantAccessClicked: function () {},
    onRevokeAccessClicked: function () {},
    onRemoveAccessClicked: function () {}
  }
});