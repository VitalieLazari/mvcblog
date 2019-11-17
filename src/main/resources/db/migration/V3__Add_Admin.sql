INSERT INTO public.usr(id, active, email, first_name, last_name, password, username, status_id)
VALUES (1, true, 'admin@esempla.md', 'John', 'Doe', 'Pass4admin', 'admin', 1);

INSERT INTO public.user_role(user_id, roles)
VALUES (1, 'ADMIN');