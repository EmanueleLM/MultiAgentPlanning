(define (problem meetingplanningexample18-problem)
  (:domain meetingplanningexample18-domain)
  (:objects
    marina richmond - location
    ;; timepoints: start 09:00 (t540), relevant evening departure and meeting times from 20:19 (t1219) through 22:00 (t1320)
    t540
    t1219 t1220 t1221 t1222 t1223 t1224 t1225 t1226 t1227 t1228 t1229
    t1230 t1231 t1232 t1233 t1234 t1235 t1236 t1237 t1238 t1239 t1240 t1241 t1242 t1243 t1244 t1245
    t1246 t1247 t1248 t1249 t1250 t1251 t1252 t1253 t1254 t1255 t1256 t1257 t1258 t1259
    t1260 t1261 t1262 t1263 t1264 t1265 t1266 t1267 t1268 t1269
    t1270 t1271 t1272 t1273 t1274 t1275 t1276 t1277 t1278 t1279
    t1280 t1281 t1282 t1283 t1284 t1285 t1286 t1287 t1288 t1289
    t1290 t1291 t1292 t1293 t1294 t1295 t1296 t1297 t1298 t1299
    t1300 t1301 t1302 t1303 t1304 t1305 t1306 t1307 t1308 t1309
    t1310 t1311 t1312 t1313 t1314 t1315 t1316 t1317 t1318 t1319 t1320
    - time
  )

  (:init
    ;; initial location: at Marina at 09:00 (t540)
    (at marina t540)

    ;; successor relations between the selected timepoints (ordered progression)
    (succ t540 t1219)
    (succ t1219 t1220) (succ t1220 t1221) (succ t1221 t1222) (succ t1222 t1223)
    (succ t1223 t1224) (succ t1224 t1225) (succ t1225 t1226) (succ t1226 t1227)
    (succ t1227 t1228) (succ t1228 t1229) (succ t1229 t1230) (succ t1230 t1231)
    (succ t1231 t1232) (succ t1232 t1233) (succ t1233 t1234) (succ t1234 t1235)
    (succ t1235 t1236) (succ t1236 t1237) (succ t1237 t1238) (succ t1238 t1239)
    (succ t1239 t1240) (succ t1240 t1241) (succ t1241 t1242) (succ t1242 t1243)
    (succ t1243 t1244) (succ t1244 t1245) (succ t1245 t1246) (succ t1246 t1247)
    (succ t1247 t1248) (succ t1248 t1249) (succ t1249 t1250) (succ t1250 t1251)
    (succ t1251 t1252) (succ t1252 t1253) (succ t1253 t1254) (succ t1254 t1255)
    (succ t1255 t1256) (succ t1256 t1257) (succ t1257 t1258) (succ t1258 t1259)
    (succ t1259 t1260) (succ t1260 t1261) (succ t1261 t1262) (succ t1262 t1263)
    (succ t1263 t1264) (succ t1264 t1265) (succ t1265 t1266) (succ t1266 t1267)
    (succ t1267 t1268) (succ t1268 t1269) (succ t1269 t1270) (succ t1270 t1271)
    (succ t1271 t1272) (succ t1272 t1273) (succ t1273 t1274) (succ t1274 t1275)
    (succ t1275 t1276) (succ t1276 t1277) (succ t1277 t1278) (succ t1278 t1279)
    (succ t1279 t1280) (succ t1280 t1281) (succ t1281 t1282) (succ t1282 t1283)
    (succ t1283 t1284) (succ t1284 t1285) (succ t1285 t1286) (succ t1286 t1287)
    (succ t1287 t1288) (succ t1288 t1289) (succ t1289 t1290) (succ t1290 t1291)
    (succ t1291 t1292) (succ t1292 t1293) (succ t1293 t1294) (succ t1294 t1295)
    (succ t1295 t1296) (succ t1296 t1297) (succ t1297 t1298) (succ t1298 t1299)
    (succ t1299 t1300) (succ t1300 t1301) (succ t1301 t1302) (succ t1302 t1303)
    (succ t1303 t1304) (succ t1304 t1305) (succ t1305 t1306) (succ t1306 t1307)
    (succ t1307 t1308) (succ t1308 t1309) (succ t1309 t1310) (succ t1310 t1311)
    (succ t1311 t1312) (succ t1312 t1313) (succ t1313 t1314) (succ t1314 t1315)
    (succ t1315 t1316) (succ t1316 t1317) (succ t1317 t1318) (succ t1318 t1319)
    (succ t1319 t1320)

    ;; directed travel relations derived from given travel minutes
    ;; Marina -> Richmond takes 11 minutes: travel-mr departure -> arrival (departure+11)
    ;; We include the departure times that can lead to an arrival inside Betty's available start window (t1219..t1234 -> t1230..t1245)
    (travel-mr t1219 t1230) (travel-mr t1220 t1231) (travel-mr t1221 t1232) (travel-mr t1222 t1233)
    (travel-mr t1223 t1234) (travel-mr t1224 t1235) (travel-mr t1225 t1236) (travel-mr t1226 t1237)
    (travel-mr t1227 t1238) (travel-mr t1228 t1239) (travel-mr t1229 t1240) (travel-mr t1230 t1241)
    (travel-mr t1231 t1242) (travel-mr t1232 t1243) (travel-mr t1233 t1244) (travel-mr t1234 t1245)

    ;; Richmond -> Marina takes 9 minutes: travel-rm departure -> arrival (departure+9)
    ;; Provide a reasonable set so actions are available if returning is needed
    (travel-rm t1230 t1239) (travel-rm t1231 t1240) (travel-rm t1232 t1241)
    (travel-rm t1233 t1242) (travel-rm t1234 t1243) (travel-rm t1245 t1254)
    (travel-rm t1250 t1259) (travel-rm t1305 t1314) (travel-rm t1310 t1319)

    ;; plus75 relations for enforcing exact continuous 75-minute meeting
    ;; Valid continuous 75-minute meeting start times for Betty are t1230..t1245 -> ends t1305..t1320
    (plus75 t1230 t1305) (plus75 t1231 t1306) (plus75 t1232 t1307) (plus75 t1233 t1308)
    (plus75 t1234 t1309) (plus75 t1235 t1310) (plus75 t1236 t1311) (plus75 t1237 t1312)
    (plus75 t1238 t1313) (plus75 t1239 t1314) (plus75 t1240 t1315) (plus75 t1241 t1316)
    (plus75 t1242 t1317) (plus75 t1243 t1318) (plus75 t1244 t1319) (plus75 t1245 t1320)

    ;; Betty availability window: she is at Richmond from 20:30 (t1230) through 22:00 (t1320).
    ;; Valid meeting start times for a 75-minute contiguous meeting are t1230..t1245 inclusive.
    (betty-window t1230) (betty-window t1231) (betty-window t1232) (betty-window t1233)
    (betty-window t1234) (betty-window t1235) (betty-window t1236) (betty-window t1237)
    (betty-window t1238) (betty-window t1239) (betty-window t1240) (betty-window t1241)
    (betty-window t1242) (betty-window t1243) (betty-window t1244) (betty-window t1245)
  )

  ;; Goal: have completed a contiguous meeting block with Betty of at least 75 minutes
  (:goal (met-betty))
)