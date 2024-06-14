import pkg from 'pg';
const { Pool } = pkg;
import { supabaseConfig } from '../configs/config.js';

export default class PgHelper {
    constructor() {
        this.pool = new Pool({
            user: supabaseConfig.user,
            host: supabaseConfig.host,
            database: supabaseConfig.database,
            password: supabaseConfig.password,
            port: supabaseConfig.port,
        });
    }

    async sqlQuery(query) {
        const client = await this.pool.connect();
        try {
            const res = await client.query(query);
            return res.rows;
        } catch (err) {
            console.error('Error executing query', err.stack);
            throw err;
        } finally {
            client.release();
        }
    }

    async close() {
        await this.pool.end();
    }
}