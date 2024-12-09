(ns myapp.core
  (:require [compojure.core :refer :all]
            [org.httpkit.server :refer [run-server]])) ; httpkit is a server

(defroutes myapp
  (GET "/" [] "Hello World"))

(defn -main []
  (run-server myapp {:port 5000}))
lein new myapp
[compojure "1.1.8"]
[http-kit "2.1.16"]
lein run -m myapp.core
(defroutes myapp
  (GET "/" [] "Show something")
  (POST "/" [] "Create something")
  (PUT "/" [] "Replace something")
  (PATCH "/" [] "Modify Something")
  (DELETE "/" [] "Annihilate something")
  (OPTIONS "/" [] "Appease something")
  (HEAD "/" [] "Preview something"))
(myapp {:uri "/" :request-method :post})
; => {:status 200
;     :headers {"Content-Type" "text/html; charset=utf-8}
;     :body "Create Something"}
(defroutes myapp
  (GET "/" [] (fn [req] "Do something with req")))
(defroutes myapp
  (GET "/" req "Do something with req"))
(defroutes myapp
  (GET "/hello/:name" [name] (str "Hello " name)))
(defroutes myapp
  (GET ["/file/:name.:ext" :name #".*", :ext #".*"] [name ext]
    (str "File: " name ext)))
(defroutes myapp
  (GET "/" req (str "Hello World v" (:app-version req))))

(defn wrap-version [handler]
  (fn [request]
    (handler (assoc request :app-version "1.0.1"))))

(defn -main []
  (run-server (wrap-version myapp) {:port 5000}))
[ring/ring-defaults "0.1.1"]
(ns myapp.core
  (:require [compojure.core :refer :all]
            [ring.middleware.defaults :refer :all]
            [org.httpkit.server :refer [run-server]]))
(defn -main []
  (run-server (wrap-defaults myapp site-defaults) {:port 5000}))
(defroutes myapp
  (GET "/posts" req
    (let [title (get (:params req) :title)
          author (get (:params req) :author)]
      (str "Title: " title ", Author: " author))))
(defroutes myapp
  (POST "/posts" req
    (let [title (get (:params req) :title)
          author (get (:params req) :author)]
      (str "Title: " title ", Author: " author))))
(defroutes myapp
  (GET "/" []
    {:status 200 :body "Hello World"})
  (GET "/is-403" []
    {:status 403 :body ""})
  (GET "/is-json" []
    {:status 200 :headers {"Content-Type" "application/json"} :body "{}"}))
(require '[compojure.route :as route])

(defroutes myapp
  (GET "/")
  (route/resources "/")) ; Serve static resources at the root path

(myapp {:uri "/js/script.js" :request-method :get})
; => Contents of resources/public/js/script.js
(require '[stencil.core :refer [render-string]])

(defroutes myapp
  (GET "/hello/:name" [name]
    (render-string "Hello {{name}}" {:name name})))
(require 'clojure.java.io)

(defn read-template [filename]
  (slurp (clojure.java.io/resource filename)))

(defroutes myapp
  (GET "/hello/:name" [name]
    (render-string (read-template "templates/hello.html") {:name name})))
(require '[selmer.parser :refer [render-file]])

(defroutes myapp
  (GET "/hello/:name" [name]
    (render-file "templates/hello.html" {:name name})))
(require '[hiccup.core :as hiccup])

(defroutes myapp
  (GET "/hello/:name" [name]
    (hiccup/html
      [:html
        [:body
          [:h1 {:class "title"}
            (str "Hello " name)]]])))
(require '[markdown.core :refer [md-to-html-string]])

(defroutes myapp
  (GET "/hello/:name" [name]
    (md-to-html-string "## Hello, world")))
