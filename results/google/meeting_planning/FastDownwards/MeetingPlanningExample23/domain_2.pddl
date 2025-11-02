(define (domain meeting-sf)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types location time mstage tstage route)
  (:constants
    bayview russian_hill - location
    brh rhb - route
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 - tstage
    m0 m1 m2 m3 m4 m5 m6 m7 m8 m9
    m10 m11 m12 m13 m14 m15 m16 m17 m18 m19
    m20 m21 m22 m23 m24 m25 m26 m27 m28 m29
    m30 m31 m32 m33 m34 m35 m36 m37 m38 m39
    m40 m41 m42 m43 m44 m45 m46 m47 m48 m49
    m50 m51 m52 m53 m54 m55 m56 m57 m58 m59
    m60 m61 m62 m63 m64 m65 m66 m67 m68 m69
    m70 m71 m72 m73 m74 - mstage
  )
  (:predicates
    (at ?l - location)
    (in_transit)
    (current_route ?r - route)
    (travel_stage ?s - tstage)
    (meeting_active)
    (meeting_stage ?m - mstage)
    (met_john)
    (now ?t - time)
    (next ?t1 - time ?t2 - time)
    (mnext ?m1 - mstage ?m2 - mstage)
    (snext ?s1 - tstage ?s2 - tstage)
    (avail_john ?t - time)
  )
  (:functions (total-cost))
  (:action tick-idle
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (next ?t1 ?t2) (not (in_transit)) (not (meeting_active)))
    :effect (and (not (now ?t1)) (now ?t2) (increase (total-cost) 1))
  )
  (:action start-travel-brh
    :parameters ()
    :precondition (and (at bayview) (not (in_transit)) (not (meeting_active)))
    :effect (and (not (at bayview)) (in_transit) (current_route brh) (travel_stage s0))
  )
  (:action start-travel-rhb
    :parameters ()
    :precondition (and (at russian_hill) (not (in_transit)) (not (meeting_active)))
    :effect (and (not (at russian_hill)) (in_transit) (current_route rhb) (travel_stage s0))
  )
  (:action tick-travel-progress
    :parameters (?t1 - time ?t2 - time ?s1 - tstage ?s2 - tstage)
    :precondition (and (now ?t1) (next ?t1 ?t2) (in_transit) (travel_stage ?s1) (snext ?s1 ?s2))
    :effect (and (not (now ?t1)) (now ?t2) (not (travel_stage ?s1)) (travel_stage ?s2) (increase (total-cost) 1))
  )
  (:action finish-travel-brh
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (next ?t1 ?t2) (in_transit) (current_route brh) (travel_stage s22))
    :effect (and (not (now ?t1)) (now ?t2) (not (in_transit)) (not (current_route brh)) (not (travel_stage s22)) (at russian_hill) (increase (total-cost) 1))
  )
  (:action finish-travel-rhb
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (next ?t1 ?t2) (in_transit) (current_route rhb) (travel_stage s22))
    :effect (and (not (now ?t1)) (now ?t2) (not (in_transit)) (not (current_route rhb)) (not (travel_stage s22)) (at bayview) (increase (total-cost) 1))
  )
  (:action start-meeting-john
    :parameters (?t - time)
    :precondition (and (at russian_hill) (not (in_transit)) (not (meeting_active)) (now ?t) (avail_john ?t))
    :effect (and (meeting_active) (meeting_stage m0))
  )
  (:action tick-meeting-progress
    :parameters (?t1 - time ?t2 - time ?m1 - mstage ?m2 - mstage)
    :precondition (and (now ?t1) (next ?t1 ?t2) (meeting_active) (meeting_stage ?m1) (mnext ?m1 ?m2) (avail_john ?t1))
    :effect (and (not (now ?t1)) (now ?t2) (not (meeting_stage ?m1)) (meeting_stage ?m2) (increase (total-cost) 1))
  )
  (:action tick-meeting-complete-min
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (next ?t1 ?t2) (meeting_active) (meeting_stage m74) (avail_john ?t1))
    :effect (and (not (now ?t1)) (now ?t2) (not (meeting_stage m74)) (met_john) (increase (total-cost) 1))
  )
  (:action tick-meeting-beyond-min
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (next ?t1 ?t2) (meeting_active) (met_john) (avail_john ?t1))
    :effect (and (not (now ?t1)) (now ?t2) (increase (total-cost) 1))
  )
  (:action end-meeting-john
    :parameters ()
    :precondition (and (meeting_active) (met_john))
    :effect (and (not (meeting_active)))
  )
)