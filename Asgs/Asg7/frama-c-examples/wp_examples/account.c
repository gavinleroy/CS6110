struct account {
  int lower_limit;
  int upper_limit;
  int balance;
};

void deposit(struct account* account, int amount) {
  account->balance += amount;
}

void withdraw(struct account* account, int amount) {
  account->balance -= amount;
}

int get_balance(struct account* account) { return account ->balance; }

void init_account(struct account* account, int lower_limit, int upper_limit) {
  account->lower_limit = lower_limit;
  account -> upper_limit = upper_limit;
  account->balance = 0;
}

int main () {
  struct account _Account;
  struct account* myAccount = &_Account;
  init_account(myAccount,-100, 2000);
  deposit(myAccount,10);
  withdraw(myAccount,20);
  int current_balance = get_balance(myAccount);
  return 0;
}
