import db from "../config/database.js";



export const getProduct = async(req, res) => {
    // const gender = req.body.gender;
    // const style = req.body.style;
    // const size = req.body.size;
    const data = await getProductDB(req.body);
    res.status(200).json({ status: 200, data });
}

export const createOrder = async(req, res) => {
    const dbput = await createOrderDB(req.body);
    res.status(200).json({ status: 200, dbput });
}

export const manageOrder = async(req, res) => {
    const alldb = await manageOrderDB(req.body);
    res.status(200).json({ status: 200, alldb })
}

const createOrderDB = async(detail) => {

    const { member_id, name_cus, doc_no, product_code, size, price, address } = detail;
    console.log(member_id, name_cus, doc_no, product_code, size, price, address);

    return new Promise(async(resolve) => {

        // let str = `INSERT INTO product.order_detail ( member_id, name_cus, doc_no, product_code, size, price, address) 
        // VALUES ( '9', 'tw', '58963', '1002', '1', '400', 'ontheroaad')`
        // console.log(str);

        // //const params = [member_id, name_cus, doc_no, product_code, price];

        let str = `INSERT INTO product.order_detail (member_id, name_cus, doc_no, product_code, size, price, address) 
        VALUES ( ?, ?, ?, ?, ?, ?, ?)
        [member_id, name_cus, doc_no, product_code, size, price,address]`

        const params = [member_id, name_cus, doc_no, product_code, size, price, address];

        db.query(str, params, (err, results) => {
            if (err) {
                console.log(err);
                resolve(null);
            }


            resolve(results);
        });
    });
}



const getProductDB = async(filter) => {

    const { gender, style, size, limit, pageKey } = filter;
    console.log(gender, style, size);

    return new Promise(async(resolve) => {

        let str = `SELECT 
                        products.gender,
                        products.size,
                        products.price,
                        CONCAT(type.name, ' / ', style.name) AS style
                        
                    FROM product.products
                    
                    INNER JOIN product.style
                    ON products.style_id = style.id
                    
                    INNER JOIN product.type
                    ON style.type_id = type.id 

        WHERE products.gender = ?
        LIMIT 2 OFFSET 0`;


        const params = [gender, style, size, limit, pageKey];

        db.query(str, params, (err, results) => {
            if (err) {
                console.log(err);
                resolve(null);
            }


            resolve(results);
        });
    });

}

const manageOrderDB = async(order) => {

    const { sale_status, limit, pageKey } = order;
    console.log(sale_status);

    return new Promise(async(resolve) => {

        let str = `SELECT * FROM product.orders
                 WHERE sale_status = ?
                LIMIT 2 OFFSET 0`;


        const params = [sale_status, limit, pageKey];

        db.query(str, params, (err, results) => {
            if (err) {
                console.log(err);
                resolve(null);
            }


            resolve(results);
        });
    });
}