const request = require('supertest');
const app = require('./app');

describe('Tester la route racine /', () => {
  test('Elle doit répondre avec le message "Hello, World!"', async () => {
    const response = await request(app).get('/');
    expect(response.statusCode).toBe(200);
    expect(response.text).toBe('Hello, World!');
  });
});

describe('Tester la route /name/:name', () => {
  test('Elle doit répondre avec un message personnalisé', async () => {
    const name = 'Alice';
    const response = await request(app).get(`/name/${name}`);
    expect(response.statusCode).toBe(200);
    expect(response.text).toBe(`Hello, ${name}!`);
  });
});

describe('Tester la route /add/:a/:b', () => {
  test('Elle doit retourner la somme correcte pour deux nombres valides', async () => {
    const response = await request(app).get('/add/3/5');
    expect(response.statusCode).toBe(200);
    expect(response.text).toBe('8');
  });

  test('Elle doit gérer correctement les nombres décimaux', async () => {
    const response = await request(app).get('/add/2.5/3.5');
    expect(response.statusCode).toBe(200);
    expect(response.text).toBe('6');
  });

  test('Elle doit renvoyer une erreur si les entrées sont invalides', async () => {
    const response = await request(app).get('/add/foo/5');
    expect(response.statusCode).toBe(400);
    expect(response.text).toBe('Entrée invalide : les deux paramètres doivent être des nombres.');
  });
});
