create table users (
    user_id serial primary key,
    email text not null,
    "password" text not null
);
create table recipes (
    recipe_id serial primary key,
    content text not null,
    image_url text not null,
    created_date timestamp not null,
    ingredients text not null,
    user_id int not null references users(user_id),
    public_recipes int not null references users(user_id),
    private_recipes int not null references users(user_id)
);
create table ingredients (
    ingredient_id serial primary key,
    recipe_id int not null references recipes(recipe_id)
);
create table liked_recipes (
    id serial primary key,
    user_id int not null references users(user_id),
    recipe_id int not null references recipes(recipe_id)
);
create table grocery_list (
    id serial primary key,
    ingredient_id int not null references ingredients(ingredient_id),
    user_id int not null references users(user_id)
);
create table occasions (
    id serial primary key,
    user_id int not null references users(user_id),
    recipe_id int not null references recipes(recipe_id),
    "date" date not null
);