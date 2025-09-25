(define (domain meeting-orchestration)
  (:requirements :typing)
  (:types agent location time)

  (:constants
    visitor william - agent
    nobhill thecastro - location
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9
    t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
    t20 t21 t22 t23 t24 t25 t26 t27 t28 t29
    t30 t31 t32 t33 t34 t35 t36 t37 t38 t39
    t40 t41 t42 t43 t44 t45 t46 t47 t48 t49
    t50 t51 t52 t53 t54 t55 t56 t57 t58 t59
    t60 t61 t62 t63 t64 t65 t66 t67 t68 t69
    t70 t71 t72 t73 t74 t75 t76 t77 t78 t79
    t80 t81 t82 t83 t84 t85 t86 t87 t88 t89
    t90 t91 t92 t93 t94 t95 t96 t97 t98 t99
    t100 t101 t102 t103 t104 t105 t106 t107 t108 t109
    t110 t111 t112 t113 t114 t115 t116 t117 t118 t119
    t120 t121 t122 t123 t124 t125 t126 t127 t128 t129
    t130 t131 t132 t133 t134 t135 t136 t137 t138 t139
    t140 t141 t142 t143 t144 t145 t146 t147 t148 t149
    t150 t151 t152 t153 t154 t155 t156 t157 t158 t159
    t160 t161 t162 t163 t164 t165 t166 t167 t168 t169
    t170 t171 t172 t173 t174 t175 t176 t177 t178 t179
    t180 t181 t182 t183 t184 t185 t186 t187 t188 t189
    t190 t191 t192 t193 t194 t195 t196 t197 t198 t199
    t200 t201 t202 t203 t204 t205 t206 t207 t208 t209
    t210 t211 t212 t213 t214 t215 t216 t217 t218 t219
    t220 t221 t222 t223 t224 t225 t226 t227 t228 t229
    t230 t231 t232 t233 t234 t235 t236 t237 t238 t239
    t240 t241 t242 t243 t244 t245 t246 t247 t248 t249
    t250 t251 t252 t253 t254 t255 t256 t257 t258 t259
    t260 t261 t262 t263 t264 t265 t266 t267 t268 t269
    t270 t271 t272 t273 t274 t275 t276 t277 t278 t279
    t280 t281 t282 t283 t284 t285 t286 t287 t288 t289
    t290 t291 t292 t293 t294 t295 t296 t297 t298 t299
    t300 - time
  )

  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (available ?a - agent ?t - time)
    (meeting-scheduled)
  )

  (:action start_meeting_at_castro_from_t195
    :parameters ()
    :precondition (and
      (at visitor thecastro t195) (at william thecastro t195) (available william t195)
      (at visitor thecastro t196) (at william thecastro t196) (available william t196)
      (at visitor thecastro t197) (at william thecastro t197) (available william t197)
      (at visitor thecastro t198) (at william thecastro t198) (available william t198)
      (at visitor thecastro t199) (at william thecastro t199) (available william t199)
      (at visitor thecastro t200) (at william thecastro t200) (available william t200)
      (at visitor thecastro t201) (at william thecastro t201) (available william t201)
      (at visitor thecastro t202) (at william thecastro t202) (available william t202)
      (at visitor thecastro t203) (at william thecastro t203) (available william t203)
      (at visitor thecastro t204) (at william thecastro t204) (available william t204)
      (at visitor thecastro t205) (at william thecastro t205) (available william t205)
      (at visitor thecastro t206) (at william thecastro t206) (available william t206)
      (at visitor thecastro t207) (at william thecastro t207) (available william t207)
      (at visitor thecastro t208) (at william thecastro t208) (available william t208)
      (at visitor thecastro t209) (at william thecastro t209) (available william t209)
      (at visitor thecastro t210) (at william thecastro t210) (available william t210)
      (at visitor thecastro t211) (at william thecastro t211) (available william t211)
      (at visitor thecastro t212) (at william thecastro t212) (available william t212)
      (at visitor thecastro t213) (at william thecastro t213) (available william t213)
      (at visitor thecastro t214) (at william thecastro t214) (available william t214)
      (at visitor thecastro t215) (at william thecastro t215) (available william t215)
      (at visitor thecastro t216) (at william thecastro t216) (available william t216)
      (at visitor thecastro t217) (at william thecastro t217) (available william t217)
      (at visitor thecastro t218) (at william thecastro t218) (available william t218)
      (at visitor thecastro t219) (at william thecastro t219) (available william t219)
      (at visitor thecastro t220) (at william thecastro t220) (available william t220)
      (at visitor thecastro t221) (at william thecastro t221) (available william t221)
      (at visitor thecastro t222) (at william thecastro t222) (available william t222)
      (at visitor thecastro t223) (at william thecastro t223) (available william t223)
      (at visitor thecastro t224) (at william thecastro t224) (available william t224)
      (at visitor thecastro t225) (at william thecastro t225) (available william t225)
      (at visitor thecastro t226) (at william thecastro t226) (available william t226)
      (at visitor thecastro t227) (at william thecastro t227) (available william t227)
      (at visitor thecastro t228) (at william thecastro t228) (available william t228)
      (at visitor thecastro t229) (at william thecastro t229) (available william t229)
      (at visitor thecastro t230) (at william thecastro t230) (available william t230)
      (at visitor thecastro t231) (at william thecastro t231) (available william t231)
      (at visitor thecastro t232) (at william thecastro t232) (available william t232)
      (at visitor thecastro t233) (at william thecastro t233) (available william t233)
      (at visitor thecastro t234) (at william thecastro t234) (available william t234)
      (at visitor thecastro t235) (at william thecastro t235) (available william t235)
      (at visitor thecastro t236) (at william thecastro t236) (available william t236)
      (at visitor thecastro t237) (at william thecastro t237) (available william t237)
      (at visitor thecastro t238) (at william thecastro t238) (available william t238)
      (at visitor thecastro t239) (at william thecastro t239) (available william t239)
      (at visitor thecastro t240) (at william thecastro t240) (available william t240)
      (at visitor thecastro t241) (at william thecastro t241) (available william t241)
      (at visitor thecastro t242) (at william thecastro t242) (available william t242)
      (at visitor thecastro t243) (at william thecastro t243) (available william t243)
      (at visitor thecastro t244) (at william thecastro t244) (available william t244)
      (at visitor thecastro t245) (at william thecastro t245) (available william t245)
      (at visitor thecastro t246) (at william thecastro t246) (available william t246)
      (at visitor thecastro t247) (at william thecastro t247) (available william t247)
      (at visitor thecastro t248) (at william thecastro t248) (available william t248)
      (at visitor thecastro t249) (at william thecastro t249) (available william t249)
      (at visitor thecastro t250) (at william thecastro t250) (available william t250)
      (at visitor thecastro t251) (at william thecastro t251) (available william t251)
      (at visitor thecastro t252) (at william thecastro t252) (available william t252)
      (at visitor thecastro t253) (at william thecastro t253) (available william t253)
      (at visitor thecastro t254) (at william thecastro t254) (available william t254)
      (at visitor thecastro t255) (at william thecastro t255) (available william t255)
      (at visitor thecastro t256) (at william thecastro t256) (available william t256)
      (at visitor thecastro t257) (at william thecastro t257) (available william t257)
      (at visitor thecastro t258) (at william thecastro t258) (available william t258)
      (at visitor thecastro t259) (at william thecastro t259) (available william t259)
      (at visitor thecastro t260) (at william thecastro t260) (available william t260)
      (at visitor thecastro t261) (at william thecastro t261) (available william t261)
      (at visitor thecastro t262) (at william thecastro t262) (available william t262)
      (at visitor thecastro t263) (at william thecastro t263) (available william t263)
      (at visitor thecastro t264) (at william thecastro t264) (available william t264)
      (at visitor thecastro t265) (at william thecastro t265) (available william t265)
      (at visitor thecastro t266) (at william thecastro t266) (available william t266)
      (at visitor thecastro t267) (at william thecastro t267) (available william t267)
      (at visitor thecastro t268) (at william thecastro t268) (available william t268)
      (at visitor thecastro t269) (at william thecastro t269) (available william t269)
    )
    :effect (and (meeting-scheduled))
  )
)