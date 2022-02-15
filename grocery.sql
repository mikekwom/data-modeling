CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  user_name VARCHAR(30) NOT NULL,
  user_email VARCHAR(100) NOT NULL,
  user_password VARCHAR(500) NOT NULL,
  account_created TIMESTAMP NOT NULL
);

CREATE TABLE recipes (
  recipe_id SERIAL PRIMARY KEY,
  ingredients_id INT NOT NULL REFERENCES ingredients(ingredients_id),
  instructions_id INT NOT NULL REFERENCES instructions(instructions_id),
  is_public BOOLEAN,
  author_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE ingredients (
  ingredients_id SERIAL PRIMARY KEY,
  ingredients VARCHAR(2000) NOT NULL
);

CREATE TABLE instructions (
  instructions_id SERIAL PRIMARY KEY,
  instructions VARCHAR(2000) NOT NULL
);

CREATE TABLE grocery_list (
  grocery_list_id SERIAL PRIMARY KEY,
  ingredients_id INT NOT NULL REFERENCES ingredients(ingredients_id)
);

CREATE TABLE occasions (
  occasion_id SERIAL PRIMARY KEY,
  occasion_name VARCHAR(50),
  recipe_id INT NOT NULL REFERENCES recipes(recipe_id)
);

CREATE TABLE follows (
  follows_id SERIAL PRIMARY KEY,
  follower_id INT NOT NULL REFERENCES users(user_id),
  following_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE user_recipes (
  user_recipes_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(user_id),
  recipe_id INT NOT NULL REFERENCES recipes(recipe_id)
);

CREATE TABLE occasion_recipes (
  occasion_recipes_id SERIAL PRIMARY KEY,
  occasion_id INT NOT NULL REFERENCES occasions(occasion_id),
  recipe_id INT NOT NULL REFERENCES recipes(recipe_id)
);



INSERT INTO users
(user_password, user_email, user_name)
VALUES
('password', 'email@email.com', 'Mike'),
('password1', 'scott@email.com', 'Scott'),
('password2', 'meg@email.com', 'Meg');

SELECT * FROM users;

INSERT INTO instructions
(instructions)
VALUES
('put in oven'),
('knead dough'),
('mix'),
('stir');

INSERT INTO ingredients
(ingredients)
VALUES
('bread'),
('peas'),
('rice'),
('chicken'),
('pepperoni'),
('cheese'),
('green beans');

INSERT INTO recipes
(is_public, author_id, instructions_id, ingredients_id)
VALUES
(true, 2, 4, 7),
(true, 2, 4, 6),
(false, 3, 1, 1),
(true, 3, 2, 4),
(false, 2, 3, 5),
(true, 1, 2, 1),
(true, 1, 4, 2);

SELECT * FROM recipes WHERE author_id = 2;

















