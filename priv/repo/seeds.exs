# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Todo.Repo.insert!(%Todo.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
var1=Todo.Repo.insert!(%Todo.Category{title: "Dev Items",description: "The item which is in still development mode and this is also example of lonnnnnnnngggggg description....   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"});
var2=Todo.Repo.insert!(%Todo.Category{title: "Local Items", description: "The item which is given for Quality analysis"});
var3=Todo.Repo.insert!(%Todo.Category{title: "Pre Items"});
var4=Todo.Repo.insert!(%Todo.Category{title: "Production Items", description: "The item which is ready for user usage"});
var5=Todo.Repo.insert!(%Todo.Category{title: "Support Tickets", description: "Uesr reported issues"});

Todo.Repo.insert!(%Todo.Todo{category_id: var1.id,isdone: true, title: "DEV:::Print Preview table column addition"});
Todo.Repo.insert!(%Todo.Todo{category_id: var1.id,isdone: false, title: "DEV:::list view changes"});
Todo.Repo.insert!(%Todo.Todo{category_id: var1.id,isdone: false, title: "DEV:::Send mail testing"});
Todo.Repo.insert!(%Todo.Todo{category_id: var1.id,isdone: false, title: "DEV:::Report addition"});

Todo.Repo.insert!(%Todo.Todo{category_id: var2.id,isdone: true, title: "LOCAL:::Print Preview table column addition"});
Todo.Repo.insert!(%Todo.Todo{category_id: var2.id,isdone: false, title: "LOCAL:::list view changes"});
Todo.Repo.insert!(%Todo.Todo{category_id: var2.id,isdone: false, title: "LOCAL:::Send mail testing"});
Todo.Repo.insert!(%Todo.Todo{category_id: var2.id,isdone: false, title: "LOCAL:::Report addition"});

Todo.Repo.insert!(%Todo.Todo{category_id: var3.id,isdone: false, title: "PRE::::Print Preview table column addition"});
Todo.Repo.insert!(%Todo.Todo{category_id: var3.id,isdone: true, title: "PRE::::list view changes"});
Todo.Repo.insert!(%Todo.Todo{category_id: var3.id,isdone: false, title: "PRE::::Send mail testing"});
Todo.Repo.insert!(%Todo.Todo{category_id: var3.id,isdone: false, title: "PRE::::Report addition"});

Todo.Repo.insert!(%Todo.Todo{category_id: var4.id,isdone: false, title: "Production:::Print Preview table column addition"});
Todo.Repo.insert!(%Todo.Todo{category_id: var4.id,isdone: false, title: "Production:::list view changes"});
Todo.Repo.insert!(%Todo.Todo{category_id: var4.id,isdone: true, title: "Production:::Send mail testing"});
Todo.Repo.insert!(%Todo.Todo{category_id: var4.id,isdone: false, title: "Production:::Report addition"});

Todo.Repo.insert!(%Todo.Todo{category_id: var5.id,isdone: false, title: "SUPPORTTICKET:::Print Preview table column addition"});
Todo.Repo.insert!(%Todo.Todo{category_id: var5.id,isdone: false, title: "SUPPORTTICKET:::list view changes"});
Todo.Repo.insert!(%Todo.Todo{category_id: var5.id,isdone: false, title: "SUPPORTTICKET:::Send mail testing"});
Todo.Repo.insert!(%Todo.Todo{category_id: var5.id,isdone: true, title: "SUPPORTTICKET:::Report addition"});