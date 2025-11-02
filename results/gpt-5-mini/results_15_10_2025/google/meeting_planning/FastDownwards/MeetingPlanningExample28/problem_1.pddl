(define (problem meet-joshua-problem-classical)
  (:domain meeting-schedule-classical)

  (:objects
    you - agent
    joshua - person
    union-square chinatown - location
    time1080 time1081 time1082 time1083 time1084 time1085 time1086 time1087 time1088 time1089
    time1090 time1091 time1092 time1093 time1094 time1095 time1096 time1097 time1098 time1099
    time1100 time1101 time1102 time1103 time1104 time1105 time1106 time1107 time1108 time1109
    time1110 time1111 time1112 time1113 time1114 time1115 time1116 time1117 time1118 time1119
    time1120 time1121 time1122 time1123 time1124 time1125 time1126 time1127 time1128 time1129
    time1130 time1131 time1132 time1133 time1134 time1135 time1136 time1137 time1138 time1139
    time1140 time1141 time1142 time1143 time1144 time1145 time1146 time1147 time1148 time1149
    time1150 time1151 time1152 time1153 time1154 time1155 time1156 time1157 time1158 time1159
    time1160 time1161 time1162 time1163 time1164 time1165 time1166 time1167 time1168 time1169
    time1170 time1171 time1172 time1173 time1174 time1175 time1176 time1177 time1178 time1179
    time1180 time1181 time1182 time1183 time1184 time1185 time1186 time1187 time1188 time1189
    time1190 time1191 time1192 time1193 time1194 time1195 time1196 time1197 time1198 time1199
    time1200 time1201 time1202 time1203 time1204 time1205 time1206 time1207 time1208 time1209
    time1210 time1211 time1212 time1213 time1214 time1215 time1216 time1217 time1218 time1219
    time1220 time1221 time1222 time1223 time1224 time1225 time1226 time1227 time1228 time1229
    time1230 time1231 time1232 time1233 time1234 time1235 time1236 time1237 time1238 time1239
    time1240 time1241 time1242 time1243 time1244 time1245 time1246 time1247 time1248 time1249
    time1250 time1251 time1252 time1253 time1254 time1255 time1256 time1257 time1258 time1259
    time1260 time1261 time1262 time1263 time1264 time1265 time1266 time1267 time1268 time1269
    time1270 time1271 time1272 time1273 time1274 time1275 time1276 time1277 time1278 time1279
    time1280 time1281 time1282 time1283 time1284 time1285 time1286 time1287 time1288 time1289
    time1290 - time
  )

  (:init
    (at union-square)
    (at-time time1080)

    (adv1 time1080 time1081) (adv1 time1081 time1082) (adv1 time1082 time1083) (adv1 time1083 time1084) (adv1 time1084 time1085)
    (adv1 time1085 time1086) (adv1 time1086 time1087) (adv1 time1087 time1088) (adv1 time1088 time1089) (adv1 time1089 time1090)
    (adv1 time1090 time1091) (adv1 time1091 time1092) (adv1 time1092 time1093) (adv1 time1093 time1094) (adv1 time1094 time1095)
    (adv1 time1095 time1096) (adv1 time1096 time1097) (adv1 time1097 time1098) (adv1 time1098 time1099) (adv1 time1099 time1100)
    (adv1 time1100 time1101) (adv1 time1101 time1102) (adv1 time1102 time1103) (adv1 time1103 time1104) (adv1 time1104 time1105)
    (adv1 time1105 time1106) (adv1 time1106 time1107) (adv1 time1107 time1108) (adv1 time1108 time1109) (adv1 time1109 time1110)
    (adv1 time1110 time1111) (adv1 time1111 time1112) (adv1 time1112 time1113) (adv1 time1113 time1114) (adv1 time1114 time1115)
    (adv1 time1115 time1116) (adv1 time1116 time1117) (adv1 time1117 time1118) (adv1 time1118 time1119) (adv1 time1119 time1120)
    (adv1 time1120 time1121) (adv1 time1121 time1122) (adv1 time1122 time1123) (adv1 time1123 time1124) (adv1 time1124 time1125)
    (adv1 time1125 time1126) (adv1 time1126 time1127) (adv1 time1127 time1128) (adv1 time1128 time1129) (adv1 time1129 time1130)
    (adv1 time1130 time1131) (adv1 time1131 time1132) (adv1 time1132 time1133) (adv1 time1133 time1134) (adv1 time1134 time1135)
    (adv1 time1135 time1136) (adv1 time1136 time1137) (adv1 time1137 time1138) (adv1 time1138 time1139) (adv1 time1139 time1140)
    (adv1 time1140 time1141) (adv1 time1141 time1142) (adv1 time1142 time1143) (adv1 time1143 time1144) (adv1 time1144 time1145)
    (adv1 time1145 time1146) (adv1 time1146 time1147) (adv1 time1147 time1148) (adv1 time1148 time1149) (adv1 time1149 time1150)
    (adv1 time1150 time1151) (adv1 time1151 time1152) (adv1 time1152 time1153) (adv1 time1153 time1154) (adv1 time1154 time1155)
    (adv1 time1155 time1156) (adv1 time1156 time1157) (adv1 time1157 time1158) (adv1 time1158 time1159) (adv1 time1159 time1160)
    (adv1 time1160 time1161) (adv1 time1161 time1162) (adv1 time1162 time1163) (adv1 time1163 time1164) (adv1 time1164 time1165)
    (adv1 time1165 time1166) (adv1 time1166 time1167) (adv1 time1167 time1168) (adv1 time1168 time1169) (adv1 time1169 time1170)
    (adv1 time1170 time1171) (adv1 time1171 time1172) (adv1 time1172 time1173) (adv1 time1173 time1174) (adv1 time1174 time1175)
    (adv1 time1175 time1176) (adv1 time1176 time1177) (adv1 time1177 time1178) (adv1 time1178 time1179) (adv1 time1179 time1180)
    (adv1 time1180 time1181) (adv1 time1181 time1182) (adv1 time1182 time1183) (adv1 time1183 time1184) (adv1 time1184 time1185)
    (adv1 time1185 time1186) (adv1 time1186 time1187) (adv1 time1187 time1188) (adv1 time1188 time1189) (adv1 time1189 time1190)
    (adv1 time1190 time1191) (adv1 time1191 time1192) (adv1 time1192 time1193) (adv1 time1193 time1194) (adv1 time1194 time1195)
    (adv1 time1195 time1196) (adv1 time1196 time1197) (adv1 time1197 time1198) (adv1 time1198 time1199) (adv1 time1199 time1200)
    (adv1 time1200 time1201) (adv1 time1201 time1202) (adv1 time1202 time1203) (adv1 time1203 time1204) (adv1 time1204 time1205)
    (adv1 time1205 time1206) (adv1 time1206 time1207) (adv1 time1207 time1208) (adv1 time1208 time1209) (adv1 time1209 time1210)
    (adv1 time1210 time1211) (adv1 time1211 time1212) (adv1 time1212 time1213) (adv1 time1213 time1214) (adv1 time1214 time1215)
    (adv1 time1215 time1216) (adv1 time1216 time1217) (adv1 time1217 time1218) (adv1 time1218 time1219) (adv1 time1219 time1220)
    (adv1 time1220 time1221) (adv1 time1221 time1222) (adv1 time1222 time1223) (adv1 time1223 time1224) (adv1 time1224 time1225)
    (adv1 time1225 time1226) (adv1 time1226 time1227) (adv1 time1227 time1228) (adv1 time1228 time1229) (adv1 time1229 time1230)
    (adv1 time1230 time1231) (adv1 time1231 time1232) (adv1 time1232 time1233) (adv1 time1233 time1234) (adv1 time1234 time1235)
    (adv1 time1235 time1236) (adv1 time1236 time1237) (adv1 time1237 time1238) (adv1 time1238 time1239) (adv1 time1239 time1240)
    (adv1 time1240 time1241) (adv1 time1241 time1242) (adv1 time1242 time1243) (adv1 time1243 time1244) (adv1 time1244 time1245)
    (adv1 time1245 time1246) (adv1 time1246 time1247) (adv1 time1247 time1248) (adv1 time1248 time1249) (adv1 time1249 time1250)
    (adv1 time1250 time1251) (adv1 time1251 time1252) (adv1 time1252 time1253) (adv1 time1253 time1254) (adv1 time1254 time1255)
    (adv1 time1255 time1256) (adv1 time1256 time1257) (adv1 time1257 time1258) (adv1 time1258 time1259) (adv1 time1259 time1260)
    (adv1 time1260 time1261) (adv1 time1261 time1262) (adv1 time1262 time1263) (adv1 time1263 time1264) (adv1 time1264 time1265)
    (adv1 time1265 time1266) (adv1 time1266 time1267) (adv1 time1267 time1268) (adv1 time1268 time1269) (adv1 time1269 time1270)
    (adv1 time1270 time1271) (adv1 time1271 time1272) (adv1 time1272 time1273) (adv1 time1273 time1274) (adv1 time1274 time1275)
    (adv1 time1275 time1276) (adv1 time1276 time1277) (adv1 time1277 time1278) (adv1 time1278 time1279) (adv1 time1279 time1280)
    (adv1 time1280 time1281) (adv1 time1281 time1282) (adv1 time1282 time1283) (adv1 time1283 time1284) (adv1 time1284 time1285)
    (adv1 time1285 time1286) (adv1 time1286 time1287) (adv1 time1287 time1288) (adv1 time1288 time1289) (adv1 time1289 time1290)

    (adv7 time1080 time1087) (adv7 time1081 time1088) (adv7 time1082 time1089) (adv7 time1083 time1090) (adv7 time1084 time1091)
    (adv7 time1085 time1092) (adv7 time1086 time1093) (adv7 time1087 time1094) (adv7 time1088 time1095) (adv7 time1089 time1096)
    (adv7 time1090 time1097) (adv7 time1091 time1098) (adv7 time1092 time1099) (adv7 time1093 time1100) (adv7 time1094 time1101)
    (adv7 time1095 time1102) (adv7 time1096 time1103) (adv7 time1097 time1104) (adv7 time1098 time1105) (adv7 time1099 time1106)
    (adv7 time1100 time1107) (adv7 time1101 time1108) (adv7 time1102 time1109) (adv7 time1103 time1110) (adv7 time1104 time1111)
    (adv7 time1105 time1112) (adv7 time1106 time1113) (adv7 time1107 time1114) (adv7 time1108 time1115) (adv7 time1109 time1116)
    (adv7 time1110 time1117) (adv7 time1111 time1118) (adv7 time1112 time1119) (adv7 time1113 time1120) (adv7 time1114 time1121)
    (adv7 time1115 time1122) (adv7 time1116 time1123) (adv7 time1117 time1124) (adv7 time1118 time1125) (adv7 time1119 time1126)
    (adv7 time1120 time1127) (adv7 time1121 time1128) (adv7 time1122 time1129) (adv7 time1123 time1130) (adv7 time1124 time1131)
    (adv7 time1125 time1132) (adv7 time1126 time1133) (adv7 time1127 time1134) (adv7 time1128 time1135) (adv7 time1129 time1136)
    (adv7 time1130 time1137) (adv7 time1131 time1138) (adv7 time1132 time1139) (adv7 time1133 time1140) (adv7 time1134 time1141)
    (adv7 time1135 time1142) (adv7 time1136 time1143) (adv7 time1137 time1144) (adv7 time1138 time1145) (adv7 time1139 time1146)
    (adv7 time1140 time1147) (adv7 time1141 time1148) (adv7 time1142 time1149) (adv7 time1143 time1150) (adv7 time1144 time1151)
    (adv7 time1145 time1152) (adv7 time1146 time1153) (adv7 time1147 time1154) (adv7 time1148 time1155) (adv7 time1149 time1156)
    (adv7 time1150 time1157) (adv7 time1151 time1158) (adv7 time1152 time1159) (adv7 time1153 time1160) (adv7 time1154 time1161)
    (adv7 time1155 time1162) (adv7 time1156 time1163) (adv7 time1157 time1164) (adv7 time1158 time1165) (adv7 time1159 time1166)
    (adv7 time1160 time1167) (adv7 time1161 time1168) (adv7 time1162 time1169) (adv7 time1163 time1170) (adv7 time1164 time1171)
    (adv7 time1165 time1172) (adv7 time1166 time1173) (adv7 time1167 time1174) (adv7 time1168 time1175) (adv7 time1169 time1176)
    (adv7 time1170 time1177) (adv7 time1171 time1178) (adv7 time1172 time1179) (adv7 time1173 time1180) (adv7 time1174 time1181)
    (adv7 time1175 time1182) (adv7 time1176 time1183) (adv7 time1177 time1184) (adv7 time1178 time1185) (adv7 time1179 time1186)
    (adv7 time1180 time1187) (adv7 time1181 time1188) (adv7 time1182 time1189) (adv7 time1183 time1190) (adv7 time1184 time1191)
    (adv7 time1185 time1192) (adv7 time1186 time1193) (adv7 time1187 time1194) (adv7 time1188 time1195) (adv7 time1189 time1196)
    (adv7 time1190 time1197) (adv7 time1191 time1198) (adv7 time1192 time1199) (adv7 time1193 time1200) (adv7 time1194 time1201)
    (adv7 time1195 time1202) (adv7 time1196 time1203) (adv7 time1197 time1204) (adv7 time1198 time1205) (adv7 time1199 time1206)
    (adv7 time1200 time1207) (adv7 time1201 time1208) (adv7 time1202 time1209) (adv7 time1203 time1210) (adv7 time1204 time1211)
    (adv7 time1205 time1212) (adv7 time1206 time1213) (adv7 time1207 time1214) (adv7 time1208 time1215) (adv7 time1209 time1216)
    (adv7 time1210 time1217) (adv7 time1211 time1218) (adv7 time1212 time1219) (adv7 time1213 time1220) (adv7 time1214 time1221)
    (adv7 time1215 time1222) (adv7 time1216 time1223) (adv7 time1217 time1224) (adv7 time1218 time1225) (adv7 time1219 time1226)
    (adv7 time1220 time1227) (adv7 time1221 time1228) (adv7 time1222 time1229) (adv7 time1223 time1230) (adv7 time1224 time1231)
    (adv7 time1225 time1232) (adv7 time1226 time1233) (adv7 time1227 time1234) (adv7 time1228 time1235) (adv7 time1229 time1236)
    (adv7 time1230 time1237) (adv7 time1231 time1238) (adv7 time1232 time1239) (adv7 time1233 time1240) (adv7 time1234 time1241)
    (adv7 time1235 time1242) (adv7 time1236 time1243) (adv7 time1237 time1244) (adv7 time1238 time1245) (adv7 time1239 time1246)
    (adv7 time1240 time1247) (adv7 time1241 time1248) (adv7 time1242 time1249) (adv7 time1243 time1250) (adv7 time1244 time1251)
    (adv7 time1245 time1252) (adv7 time1246 time1253) (adv7 time1247 time1254) (adv7 time1248 time1255) (adv7 time1249 time1256)
    (adv7 time1250 time1257) (adv7 time1251 time1258) (adv7 time1252 time1259) (adv7 time1253 time1260) (adv7 time1254 time1261)
    (adv7 time1255 time1262) (adv7 time1256 time1263) (adv7 time1257 time1264) (adv7 time1258 time1265) (adv7 time1259 time1266)
    (adv7 time1260 time1267) (adv7 time1261 time1268) (adv7 time1262 time1269) (adv7 time1263 time1270) (adv7 time1264 time1271)
    (adv7 time1265 time1272) (adv7 time1266 time1273) (adv7 time1267 time1274) (adv7 time1268 time1275) (adv7 time1269 time1276)
    (adv7 time1270 time1277) (adv7 time1271 time1278) (adv7 time1272 time1279) (adv7 time1273 time1280) (adv7 time1274 time1281)
    (adv7 time1275 time1282) (adv7 time1276 time1283) (adv7 time1277 time1284) (adv7 time1278 time1285) (adv7 time1279 time1286)
    (adv7 time1280 time1287) (adv7 time1281 time1288) (adv7 time1282 time1289) (adv7 time1283 time1290)

    (adv75 time1080 time1155) (adv75 time1081 time1156) (adv75 time1082 time1157) (adv75 time1083 time1158) (adv75 time1084 time1159)
    (adv75 time1085 time1160) (adv75 time1086 time1161) (adv75 time1087 time1162) (adv75 time1088 time1163) (adv75 time1089 time1164)
    (adv75 time1090 time1165) (adv75 time1091 time1166) (adv75 time1092 time1167) (adv75 time1093 time1168) (adv75 time1094 time1169)
    (adv75 time1095 time1170) (adv75 time1096 time1171) (adv75 time1097 time1172) (adv75 time1098 time1173) (adv75 time1099 time1174)
    (adv75 time1100 time1175) (adv75 time1101 time1176) (adv75 time1102 time1177) (adv75 time1103 time1178) (adv75 time1104 time1179)
    (adv75 time1105 time1180) (adv75 time1106 time1181) (adv75 time1107 time1182) (adv75 time1108 time1183) (adv75 time1109 time1184)
    (adv75 time1110 time1185) (adv75 time1111 time1186) (adv75 time1112 time1187) (adv75 time1113 time1188) (adv75 time1114 time1189)
    (adv75 time1115 time1190) (adv75 time1116 time1191) (adv75 time1117 time1192) (adv75 time1118 time1193) (adv75 time1119 time1194)
    (adv75 time1120 time1195) (adv75 time1121 time1196) (adv75 time1122 time1197) (adv75 time1123 time1198) (adv75 time1124 time1199)
    (adv75 time1125 time1200) (adv75 time1126 time1201) (adv75 time1127 time1202) (adv75 time1128 time1203) (adv75 time1129 time1204)
    (adv75 time1130 time1205) (adv75 time1131 time1206) (adv75 time1132 time1207) (adv75 time1133 time1208) (adv75 time1134 time1209)
    (adv75 time1135 time1210) (adv75 time1136 time1211) (adv75 time1137 time1212) (adv75 time1138 time1213) (adv75 time1139 time1214)
    (adv75 time1140 time1215)

    (start-ok time1080) (start-ok time1081) (start-ok time1082) (start-ok time1083) (start-ok time1084)
    (start-ok time1085) (start-ok time1086) (start-ok time1087) (start-ok time1088) (start-ok time1089)
    (start-ok time1090) (start-ok time1091) (start-ok time1092) (start-ok time1093) (start-ok time1094)
    (start-ok time1095) (start-ok time1096) (start-ok time1097) (start-ok time1098) (start-ok time1099)
    (start-ok time1100) (start-ok time1101) (start-ok time1102) (start-ok time1103) (start-ok time1104)
    (start-ok time1105) (start-ok time1106) (start-ok time1107) (start-ok time1108) (start-ok time1109)
    (start-ok time1110) (start-ok time1111) (start-ok time1112) (start-ok time1113) (start-ok time1114)
    (start-ok time1115) (start-ok time1116) (start-ok time1117) (start-ok time1118) (start-ok time1119)
    (start-ok time1120) (start-ok time1121) (start-ok time1122) (start-ok time1123) (start-ok time1124)
    (start-ok time1125) (start-ok time1126) (start-ok time1127) (start-ok time1128) (start-ok time1129)
    (start-ok time1130) (start-ok time1131) (start-ok time1132) (start-ok time1133) (start-ok time1134)
    (start-ok time1135) (start-ok time1136) (start-ok time1137) (start-ok time1138) (start-ok time1139)
    (start-ok time1140) (start-ok time1141) (start-ok time1142) (start-ok time1143) (start-ok time1144)
    (start-ok time1145) (start-ok time1146) (start-ok time1147) (start-ok time1148) (start-ok time1149)
    (start-ok time1150) (start-ok time1151) (start-ok time1152) (start-ok time1153) (start-ok time1154)
    (start-ok time1155) (start-ok time1156) (start-ok time1157) (start-ok time1158) (start-ok time1159)
    (start-ok time1160) (start-ok time1161) (start-ok time1162) (start-ok time1163) (start-ok time1164)
    (start-ok time1165) (start-ok time1166) (start-ok time1167) (start-ok time1168) (start-ok time1169)
    (start-ok time1170) (start-ok time1171) (start-ok time1172) (start-ok time1173) (start-ok time1174)
    (start-ok time1175) (start-ok time1176) (start-ok time1177) (start-ok time1178) (start-ok time1179)
    (start-ok time1180) (start-ok time1181) (start-ok time1182) (start-ok time1183) (start-ok time1184)
    (start-ok time1185) (start-ok time1186) (start-ok time1187) (start-ok time1188) (start-ok time1189)
    (start-ok time1190) (start-ok time1191) (start-ok time1192) (start-ok time1193) (start-ok time1194)
    (start-ok time1195) (start-ok time1196) (start-ok time1197) (start-ok time1198) (start-ok time1199)
    (start-ok time1200) (start-ok time1201) (start-ok time1202) (start-ok time1203) (start-ok time1204)
    (start-ok time1205) (start-ok time1206) (start-ok time1207) (start-ok time1208) (start-ok time1209)
    (start-ok time1210) (start-ok time1211) (start-ok time1212) (start-ok time1213) (start-ok time1214)
    (start-ok time1215)
  )

  (:goal (met joshua))

  (:metric minimize (total-cost))
)