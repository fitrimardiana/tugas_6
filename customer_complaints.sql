USE consumer;

/* Jumlah komplain setiap bulan */
SELECT CONCAT (YEAR(date_received), '/', MONTH(date_received)) AS tahun_bulan, COUNT (*) AS jumlah_bulanan
FROM consumer_complaints
GROUP BY YEAR(date_received), MONTH(date_received);


/* Komplain yang memiliki tags 'Older American' */
SELECT * FROM consumer_complaints WHERE tags = 'Older American';


/* Membuat view yang menampilkan data nama perusahaan, jumlah company response to consumer */
CREATE VIEW jml_company_response_to_consumer AS
    SELECT company,
           SUM(IF(company_response_to_consumer = 'Closed', 1, 0)) AS 'Closed',
           SUM(IF(company_response_to_consumer = 'Closed with explanation', 1, 0)) AS 'Closed with explanation' ,
           SUM(IF(company_response_to_consumer = 'Closed with non-monetary relief', 1, 0)) AS 'Closed with non-monetary relief'
    FROM consumer_complaints
    GROUP BY company;

