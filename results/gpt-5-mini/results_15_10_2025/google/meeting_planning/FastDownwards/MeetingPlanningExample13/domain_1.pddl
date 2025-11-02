(define (domain meet-betty-domain)
  (:requirements :typing :adl :action-costs)
  (:types agent location time)
  (:predicates
    (at ?a - agent ?l - location)
    (current-time ?t - time)
    (next ?t1 - time ?t2 - time)
    (plus18 ?t1 - time ?t2 - time)
    (ge-1125 ?t - time)
    (meeting-start-allowed ?t - time)
    (betty-ready)
    (met ?a - agent ?b - agent)
  )

  (:action wait
    :parameters (?from - time ?to - time)
    :precondition (and (current-time ?from) (next ?from ?to))
    :effect (and (not (current-time ?from)) (current-time ?to))
  )

  (:action travel-you
    :parameters (?from - time ?to - time)
    :precondition (and (current-time ?from) (plus18 ?from ?to) (at you presidio))
    :effect (and (not (at you presidio)) (at you northbeach) (not (current-time ?from)) (current-time ?to))
  )

  (:action betty-become-available
    :parameters (?t - time)
    :precondition (and (current-time ?t) (ge-1125 ?t))
    :effect (and (betty-ready) (at betty northbeach))
  )

  (:action travel-betty
    :parameters (?from - time ?to - time)
    :precondition (and (current-time ?from) (plus18 ?from ?to) (at betty northbeach))
    :effect (and (not (at betty northbeach)) (at betty presidio) (not (current-time ?from)) (current-time ?to))
  )

  (:action wait-noop
    :parameters ()
    :precondition ()
    :effect ()
  )

  (:action meet-1125
    :parameters ()
    :precondition (and (current-time t1125) (meeting-start-allowed t1125) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1125)) (current-time t1320) (met you betty))
    :cost 1124805
  )

  (:action meet-1126
    :parameters ()
    :precondition (and (current-time t1126) (meeting-start-allowed t1126) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1126)) (current-time t1320) (met you betty))
    :cost 1125806
  )

  (:action meet-1127
    :parameters ()
    :precondition (and (current-time t1127) (meeting-start-allowed t1127) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1127)) (current-time t1320) (met you betty))
    :cost 1126807
  )

  (:action meet-1128
    :parameters ()
    :precondition (and (current-time t1128) (meeting-start-allowed t1128) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1128)) (current-time t1320) (met you betty))
    :cost 1127808
  )

  (:action meet-1129
    :parameters ()
    :precondition (and (current-time t1129) (meeting-start-allowed t1129) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1129)) (current-time t1320) (met you betty))
    :cost 1128809
  )

  (:action meet-1130
    :parameters ()
    :precondition (and (current-time t1130) (meeting-start-allowed t1130) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1130)) (current-time t1320) (met you betty))
    :cost 1129810
  )

  (:action meet-1131
    :parameters ()
    :precondition (and (current-time t1131) (meeting-start-allowed t1131) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1131)) (current-time t1320) (met you betty))
    :cost 1130811
  )

  (:action meet-1132
    :parameters ()
    :precondition (and (current-time t1132) (meeting-start-allowed t1132) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1132)) (current-time t1320) (met you betty))
    :cost 1131812
  )

  (:action meet-1133
    :parameters ()
    :precondition (and (current-time t1133) (meeting-start-allowed t1133) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1133)) (current-time t1320) (met you betty))
    :cost 1132813
  )

  (:action meet-1134
    :parameters ()
    :precondition (and (current-time t1134) (meeting-start-allowed t1134) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1134)) (current-time t1320) (met you betty))
    :cost 1133814
  )

  (:action meet-1135
    :parameters ()
    :precondition (and (current-time t1135) (meeting-start-allowed t1135) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1135)) (current-time t1320) (met you betty))
    :cost 1134815
  )

  (:action meet-1136
    :parameters ()
    :precondition (and (current-time t1136) (meeting-start-allowed t1136) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1136)) (current-time t1320) (met you betty))
    :cost 1135816
  )

  (:action meet-1137
    :parameters ()
    :precondition (and (current-time t1137) (meeting-start-allowed t1137) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1137)) (current-time t1320) (met you betty))
    :cost 1136817
  )

  (:action meet-1138
    :parameters ()
    :precondition (and (current-time t1138) (meeting-start-allowed t1138) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1138)) (current-time t1320) (met you betty))
    :cost 1137818
  )

  (:action meet-1139
    :parameters ()
    :precondition (and (current-time t1139) (meeting-start-allowed t1139) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1139)) (current-time t1320) (met you betty))
    :cost 1138819
  )

  (:action meet-1140
    :parameters ()
    :precondition (and (current-time t1140) (meeting-start-allowed t1140) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1140)) (current-time t1320) (met you betty))
    :cost 1139820
  )

  (:action meet-1141
    :parameters ()
    :precondition (and (current-time t1141) (meeting-start-allowed t1141) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1141)) (current-time t1320) (met you betty))
    :cost 1140821
  )

  (:action meet-1142
    :parameters ()
    :precondition (and (current-time t1142) (meeting-start-allowed t1142) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1142)) (current-time t1320) (met you betty))
    :cost 1141822
  )

  (:action meet-1143
    :parameters ()
    :precondition (and (current-time t1143) (meeting-start-allowed t1143) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1143)) (current-time t1320) (met you betty))
    :cost 1142823
  )

  (:action meet-1144
    :parameters ()
    :precondition (and (current-time t1144) (meeting-start-allowed t1144) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1144)) (current-time t1320) (met you betty))
    :cost 1143824
  )

  (:action meet-1145
    :parameters ()
    :precondition (and (current-time t1145) (meeting-start-allowed t1145) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1145)) (current-time t1320) (met you betty))
    :cost 1144825
  )

  (:action meet-1146
    :parameters ()
    :precondition (and (current-time t1146) (meeting-start-allowed t1146) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1146)) (current-time t1320) (met you betty))
    :cost 1145826
  )

  (:action meet-1147
    :parameters ()
    :precondition (and (current-time t1147) (meeting-start-allowed t1147) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1147)) (current-time t1320) (met you betty))
    :cost 1146827
  )

  (:action meet-1148
    :parameters ()
    :precondition (and (current-time t1148) (meeting-start-allowed t1148) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1148)) (current-time t1320) (met you betty))
    :cost 1147828
  )

  (:action meet-1149
    :parameters ()
    :precondition (and (current-time t1149) (meeting-start-allowed t1149) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1149)) (current-time t1320) (met you betty))
    :cost 1148829
  )

  (:action meet-1150
    :parameters ()
    :precondition (and (current-time t1150) (meeting-start-allowed t1150) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1150)) (current-time t1320) (met you betty))
    :cost 1149830
  )

  (:action meet-1151
    :parameters ()
    :precondition (and (current-time t1151) (meeting-start-allowed t1151) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1151)) (current-time t1320) (met you betty))
    :cost 1150831
  )

  (:action meet-1152
    :parameters ()
    :precondition (and (current-time t1152) (meeting-start-allowed t1152) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1152)) (current-time t1320) (met you betty))
    :cost 1151832
  )

  (:action meet-1153
    :parameters ()
    :precondition (and (current-time t1153) (meeting-start-allowed t1153) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1153)) (current-time t1320) (met you betty))
    :cost 1152833
  )

  (:action meet-1154
    :parameters ()
    :precondition (and (current-time t1154) (meeting-start-allowed t1154) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1154)) (current-time t1320) (met you betty))
    :cost 1153834
  )

  (:action meet-1155
    :parameters ()
    :precondition (and (current-time t1155) (meeting-start-allowed t1155) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1155)) (current-time t1320) (met you betty))
    :cost 1154835
  )

  (:action meet-1156
    :parameters ()
    :precondition (and (current-time t1156) (meeting-start-allowed t1156) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1156)) (current-time t1320) (met you betty))
    :cost 1155836
  )

  (:action meet-1157
    :parameters ()
    :precondition (and (current-time t1157) (meeting-start-allowed t1157) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1157)) (current-time t1320) (met you betty))
    :cost 1156837
  )

  (:action meet-1158
    :parameters ()
    :precondition (and (current-time t1158) (meeting-start-allowed t1158) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1158)) (current-time t1320) (met you betty))
    :cost 1157838
  )

  (:action meet-1159
    :parameters ()
    :precondition (and (current-time t1159) (meeting-start-allowed t1159) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1159)) (current-time t1320) (met you betty))
    :cost 1158839
  )

  (:action meet-1160
    :parameters ()
    :precondition (and (current-time t1160) (meeting-start-allowed t1160) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1160)) (current-time t1320) (met you betty))
    :cost 1159840
  )

  (:action meet-1161
    :parameters ()
    :precondition (and (current-time t1161) (meeting-start-allowed t1161) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1161)) (current-time t1320) (met you betty))
    :cost 1160841
  )

  (:action meet-1162
    :parameters ()
    :precondition (and (current-time t1162) (meeting-start-allowed t1162) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1162)) (current-time t1320) (met you betty))
    :cost 1161842
  )

  (:action meet-1163
    :parameters ()
    :precondition (and (current-time t1163) (meeting-start-allowed t1163) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1163)) (current-time t1320) (met you betty))
    :cost 1162843
  )

  (:action meet-1164
    :parameters ()
    :precondition (and (current-time t1164) (meeting-start-allowed t1164) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1164)) (current-time t1320) (met you betty))
    :cost 1163844
  )

  (:action meet-1165
    :parameters ()
    :precondition (and (current-time t1165) (meeting-start-allowed t1165) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1165)) (current-time t1320) (met you betty))
    :cost 1164845
  )

  (:action meet-1166
    :parameters ()
    :precondition (and (current-time t1166) (meeting-start-allowed t1166) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1166)) (current-time t1320) (met you betty))
    :cost 1165846
  )

  (:action meet-1167
    :parameters ()
    :precondition (and (current-time t1167) (meeting-start-allowed t1167) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1167)) (current-time t1320) (met you betty))
    :cost 1166847
  )

  (:action meet-1168
    :parameters ()
    :precondition (and (current-time t1168) (meeting-start-allowed t1168) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1168)) (current-time t1320) (met you betty))
    :cost 1167848
  )

  (:action meet-1169
    :parameters ()
    :precondition (and (current-time t1169) (meeting-start-allowed t1169) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1169)) (current-time t1320) (met you betty))
    :cost 1168849
  )

  (:action meet-1170
    :parameters ()
    :precondition (and (current-time t1170) (meeting-start-allowed t1170) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1170)) (current-time t1320) (met you betty))
    :cost 1169850
  )

  (:action meet-1171
    :parameters ()
    :precondition (and (current-time t1171) (meeting-start-allowed t1171) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1171)) (current-time t1320) (met you betty))
    :cost 1170851
  )

  (:action meet-1172
    :parameters ()
    :precondition (and (current-time t1172) (meeting-start-allowed t1172) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1172)) (current-time t1320) (met you betty))
    :cost 1171852
  )

  (:action meet-1173
    :parameters ()
    :precondition (and (current-time t1173) (meeting-start-allowed t1173) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1173)) (current-time t1320) (met you betty))
    :cost 1172853
  )

  (:action meet-1174
    :parameters ()
    :precondition (and (current-time t1174) (meeting-start-allowed t1174) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1174)) (current-time t1320) (met you betty))
    :cost 1173854
  )

  (:action meet-1175
    :parameters ()
    :precondition (and (current-time t1175) (meeting-start-allowed t1175) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1175)) (current-time t1320) (met you betty))
    :cost 1174855
  )

  (:action meet-1176
    :parameters ()
    :precondition (and (current-time t1176) (meeting-start-allowed t1176) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1176)) (current-time t1320) (met you betty))
    :cost 1175856
  )

  (:action meet-1177
    :parameters ()
    :precondition (and (current-time t1177) (meeting-start-allowed t1177) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1177)) (current-time t1320) (met you betty))
    :cost 1176857
  )

  (:action meet-1178
    :parameters ()
    :precondition (and (current-time t1178) (meeting-start-allowed t1178) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1178)) (current-time t1320) (met you betty))
    :cost 1177858
  )

  (:action meet-1179
    :parameters ()
    :precondition (and (current-time t1179) (meeting-start-allowed t1179) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1179)) (current-time t1320) (met you betty))
    :cost 1178859
  )

  (:action meet-1180
    :parameters ()
    :precondition (and (current-time t1180) (meeting-start-allowed t1180) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1180)) (current-time t1320) (met you betty))
    :cost 1179860
  )

  (:action meet-1181
    :parameters ()
    :precondition (and (current-time t1181) (meeting-start-allowed t1181) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1181)) (current-time t1320) (met you betty))
    :cost 1180861
  )

  (:action meet-1182
    :parameters ()
    :precondition (and (current-time t1182) (meeting-start-allowed t1182) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1182)) (current-time t1320) (met you betty))
    :cost 1181862
  )

  (:action meet-1183
    :parameters ()
    :precondition (and (current-time t1183) (meeting-start-allowed t1183) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1183)) (current-time t1320) (met you betty))
    :cost 1182863
  )

  (:action meet-1184
    :parameters ()
    :precondition (and (current-time t1184) (meeting-start-allowed t1184) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1184)) (current-time t1320) (met you betty))
    :cost 1183864
  )

  (:action meet-1185
    :parameters ()
    :precondition (and (current-time t1185) (meeting-start-allowed t1185) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1185)) (current-time t1320) (met you betty))
    :cost 1184865
  )

  (:action meet-1186
    :parameters ()
    :precondition (and (current-time t1186) (meeting-start-allowed t1186) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1186)) (current-time t1320) (met you betty))
    :cost 1185866
  )

  (:action meet-1187
    :parameters ()
    :precondition (and (current-time t1187) (meeting-start-allowed t1187) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1187)) (current-time t1320) (met you betty))
    :cost 1186867
  )

  (:action meet-1188
    :parameters ()
    :precondition (and (current-time t1188) (meeting-start-allowed t1188) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1188)) (current-time t1320) (met you betty))
    :cost 1187868
  )

  (:action meet-1189
    :parameters ()
    :precondition (and (current-time t1189) (meeting-start-allowed t1189) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1189)) (current-time t1320) (met you betty))
    :cost 1188869
  )

  (:action meet-1190
    :parameters ()
    :precondition (and (current-time t1190) (meeting-start-allowed t1190) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1190)) (current-time t1320) (met you betty))
    :cost 1189870
  )

  (:action meet-1191
    :parameters ()
    :precondition (and (current-time t1191) (meeting-start-allowed t1191) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1191)) (current-time t1320) (met you betty))
    :cost 1190871
  )

  (:action meet-1192
    :parameters ()
    :precondition (and (current-time t1192) (meeting-start-allowed t1192) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1192)) (current-time t1320) (met you betty))
    :cost 1191872
  )

  (:action meet-1193
    :parameters ()
    :precondition (and (current-time t1193) (meeting-start-allowed t1193) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1193)) (current-time t1320) (met you betty))
    :cost 1192873
  )

  (:action meet-1194
    :parameters ()
    :precondition (and (current-time t1194) (meeting-start-allowed t1194) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1194)) (current-time t1320) (met you betty))
    :cost 1193874
  )

  (:action meet-1195
    :parameters ()
    :precondition (and (current-time t1195) (meeting-start-allowed t1195) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1195)) (current-time t1320) (met you betty))
    :cost 1194875
  )

  (:action meet-1196
    :parameters ()
    :precondition (and (current-time t1196) (meeting-start-allowed t1196) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1196)) (current-time t1320) (met you betty))
    :cost 1195876
  )

  (:action meet-1197
    :parameters ()
    :precondition (and (current-time t1197) (meeting-start-allowed t1197) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1197)) (current-time t1320) (met you betty))
    :cost 1196877
  )

  (:action meet-1198
    :parameters ()
    :precondition (and (current-time t1198) (meeting-start-allowed t1198) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1198)) (current-time t1320) (met you betty))
    :cost 1197878
  )

  (:action meet-1199
    :parameters ()
    :precondition (and (current-time t1199) (meeting-start-allowed t1199) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1199)) (current-time t1320) (met you betty))
    :cost 1198879
  )

  (:action meet-1200
    :parameters ()
    :precondition (and (current-time t1200) (meeting-start-allowed t1200) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1200)) (current-time t1320) (met you betty))
    :cost 1199880
  )

  (:action meet-1201
    :parameters ()
    :precondition (and (current-time t1201) (meeting-start-allowed t1201) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1201)) (current-time t1320) (met you betty))
    :cost 1200881
  )

  (:action meet-1202
    :parameters ()
    :precondition (and (current-time t1202) (meeting-start-allowed t1202) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1202)) (current-time t1320) (met you betty))
    :cost 1201882
  )

  (:action meet-1203
    :parameters ()
    :precondition (and (current-time t1203) (meeting-start-allowed t1203) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1203)) (current-time t1320) (met you betty))
    :cost 1202883
  )

  (:action meet-1204
    :parameters ()
    :precondition (and (current-time t1204) (meeting-start-allowed t1204) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1204)) (current-time t1320) (met you betty))
    :cost 1203884
  )

  (:action meet-1205
    :parameters ()
    :precondition (and (current-time t1205) (meeting-start-allowed t1205) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1205)) (current-time t1320) (met you betty))
    :cost 1204885
  )

  (:action meet-1206
    :parameters ()
    :precondition (and (current-time t1206) (meeting-start-allowed t1206) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1206)) (current-time t1320) (met you betty))
    :cost 1205886
  )

  (:action meet-1207
    :parameters ()
    :precondition (and (current-time t1207) (meeting-start-allowed t1207) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1207)) (current-time t1320) (met you betty))
    :cost 1206887
  )

  (:action meet-1208
    :parameters ()
    :precondition (and (current-time t1208) (meeting-start-allowed t1208) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1208)) (current-time t1320) (met you betty))
    :cost 1207888
  )

  (:action meet-1209
    :parameters ()
    :precondition (and (current-time t1209) (meeting-start-allowed t1209) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1209)) (current-time t1320) (met you betty))
    :cost 1208889
  )

  (:action meet-1210
    :parameters ()
    :precondition (and (current-time t1210) (meeting-start-allowed t1210) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1210)) (current-time t1320) (met you betty))
    :cost 1209890
  )

  (:action meet-1211
    :parameters ()
    :precondition (and (current-time t1211) (meeting-start-allowed t1211) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1211)) (current-time t1320) (met you betty))
    :cost 1210891
  )

  (:action meet-1212
    :parameters ()
    :precondition (and (current-time t1212) (meeting-start-allowed t1212) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1212)) (current-time t1320) (met you betty))
    :cost 1211892
  )

  (:action meet-1213
    :parameters ()
    :precondition (and (current-time t1213) (meeting-start-allowed t1213) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1213)) (current-time t1320) (met you betty))
    :cost 1212893
  )

  (:action meet-1214
    :parameters ()
    :precondition (and (current-time t1214) (meeting-start-allowed t1214) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1214)) (current-time t1320) (met you betty))
    :cost 1213894
  )

  (:action meet-1215
    :parameters ()
    :precondition (and (current-time t1215) (meeting-start-allowed t1215) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1215)) (current-time t1320) (met you betty))
    :cost 1214895
  )

  (:action meet-1216
    :parameters ()
    :precondition (and (current-time t1216) (meeting-start-allowed t1216) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1216)) (current-time t1320) (met you betty))
    :cost 1215896
  )

  (:action meet-1217
    :parameters ()
    :precondition (and (current-time t1217) (meeting-start-allowed t1217) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1217)) (current-time t1320) (met you betty))
    :cost 1216897
  )

  (:action meet-1218
    :parameters ()
    :precondition (and (current-time t1218) (meeting-start-allowed t1218) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1218)) (current-time t1320) (met you betty))
    :cost 1217898
  )

  (:action meet-1219
    :parameters ()
    :precondition (and (current-time t1219) (meeting-start-allowed t1219) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1219)) (current-time t1320) (met you betty))
    :cost 1218899
  )

  (:action meet-1220
    :parameters ()
    :precondition (and (current-time t1220) (meeting-start-allowed t1220) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1220)) (current-time t1320) (met you betty))
    :cost 1219900
  )

  (:action meet-1221
    :parameters ()
    :precondition (and (current-time t1221) (meeting-start-allowed t1221) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1221)) (current-time t1320) (met you betty))
    :cost 1220901
  )

  (:action meet-1222
    :parameters ()
    :precondition (and (current-time t1222) (meeting-start-allowed t1222) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1222)) (current-time t1320) (met you betty))
    :cost 1221902
  )

  (:action meet-1223
    :parameters ()
    :precondition (and (current-time t1223) (meeting-start-allowed t1223) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1223)) (current-time t1320) (met you betty))
    :cost 1222903
  )

  (:action meet-1224
    :parameters ()
    :precondition (and (current-time t1224) (meeting-start-allowed t1224) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1224)) (current-time t1320) (met you betty))
    :cost 1223904
  )

  (:action meet-1225
    :parameters ()
    :precondition (and (current-time t1225) (meeting-start-allowed t1225) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1225)) (current-time t1320) (met you betty))
    :cost 1224905
  )

  (:action meet-1226
    :parameters ()
    :precondition (and (current-time t1226) (meeting-start-allowed t1226) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1226)) (current-time t1320) (met you betty))
    :cost 1225906
  )

  (:action meet-1227
    :parameters ()
    :precondition (and (current-time t1227) (meeting-start-allowed t1227) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1227)) (current-time t1320) (met you betty))
    :cost 1226907
  )

  (:action meet-1228
    :parameters ()
    :precondition (and (current-time t1228) (meeting-start-allowed t1228) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1228)) (current-time t1320) (met you betty))
    :cost 1227908
  )

  (:action meet-1229
    :parameters ()
    :precondition (and (current-time t1229) (meeting-start-allowed t1229) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1229)) (current-time t1320) (met you betty))
    :cost 1228909
  )

  (:action meet-1230
    :parameters ()
    :precondition (and (current-time t1230) (meeting-start-allowed t1230) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1230)) (current-time t1320) (met you betty))
    :cost 1229910
  )

  (:action meet-1231
    :parameters ()
    :precondition (and (current-time t1231) (meeting-start-allowed t1231) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1231)) (current-time t1320) (met you betty))
    :cost 1230911
  )

  (:action meet-1232
    :parameters ()
    :precondition (and (current-time t1232) (meeting-start-allowed t1232) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1232)) (current-time t1320) (met you betty))
    :cost 1231912
  )

  (:action meet-1233
    :parameters ()
    :precondition (and (current-time t1233) (meeting-start-allowed t1233) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1233)) (current-time t1320) (met you betty))
    :cost 1232913
  )

  (:action meet-1234
    :parameters ()
    :precondition (and (current-time t1234) (meeting-start-allowed t1234) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1234)) (current-time t1320) (met you betty))
    :cost 1233914
  )

  (:action meet-1235
    :parameters ()
    :precondition (and (current-time t1235) (meeting-start-allowed t1235) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1235)) (current-time t1320) (met you betty))
    :cost 1234915
  )

  (:action meet-1236
    :parameters ()
    :precondition (and (current-time t1236) (meeting-start-allowed t1236) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1236)) (current-time t1320) (met you betty))
    :cost 1235916
  )

  (:action meet-1237
    :parameters ()
    :precondition (and (current-time t1237) (meeting-start-allowed t1237) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1237)) (current-time t1320) (met you betty))
    :cost 1236917
  )

  (:action meet-1238
    :parameters ()
    :precondition (and (current-time t1238) (meeting-start-allowed t1238) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1238)) (current-time t1320) (met you betty))
    :cost 1237918
  )

  (:action meet-1239
    :parameters ()
    :precondition (and (current-time t1239) (meeting-start-allowed t1239) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1239)) (current-time t1320) (met you betty))
    :cost 1238919
  )

  (:action meet-1240
    :parameters ()
    :precondition (and (current-time t1240) (meeting-start-allowed t1240) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1240)) (current-time t1320) (met you betty))
    :cost 1239920
  )

  (:action meet-1241
    :parameters ()
    :precondition (and (current-time t1241) (meeting-start-allowed t1241) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1241)) (current-time t1320) (met you betty))
    :cost 1240921
  )

  (:action meet-1242
    :parameters ()
    :precondition (and (current-time t1242) (meeting-start-allowed t1242) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1242)) (current-time t1320) (met you betty))
    :cost 1241922
  )

  (:action meet-1243
    :parameters ()
    :precondition (and (current-time t1243) (meeting-start-allowed t1243) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1243)) (current-time t1320) (met you betty))
    :cost 1242923
  )

  (:action meet-1244
    :parameters ()
    :precondition (and (current-time t1244) (meeting-start-allowed t1244) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1244)) (current-time t1320) (met you betty))
    :cost 1243924
  )

  (:action meet-1245
    :parameters ()
    :precondition (and (current-time t1245) (meeting-start-allowed t1245) (at you northbeach) (betty-ready))
    :effect (and (not (current-time t1245)) (current-time t1320) (met you betty))
    :cost 1244925
  )
)