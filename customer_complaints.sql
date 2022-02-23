USE consumer;

/* Jumlah komplain setiap bulan */
SELECT month(date_received) AS bulan,
       SUM(IF(YEAR(date_received) = 2013, month(date_received), 0)) AS 'tahun 2013',
       SUM(IF(YEAR(date_received) = 2014, month(date_received), 0)) AS 'tahun 2014',
       SUM(IF(YEAR(date_received) = 2015, month(date_received), 0)) AS 'tahun 2015'
FROM consumer_complaints
GROUP BY month(date_received);


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

