(define (domain visit_san_francisco)
  (:requirements :strips :typing :negative-preconditions)
  (:types location friend time_increment)
  (:predicates 
    (at ?l - location)
    (meeting_with ?f - friend)
    (time ?t - time_increment)
    (met_for_minimum ?f - friend)
    (succeeding_time ?t1 ?t2 - time_increment)
    (jessica_available ?t - time_increment)
  )
  (:constants
    presidio marina_district - location
    jessica - friend
    minute_0 minute_5 minute_10 minute_15 minute_20 minute_25 minute_30 minute_35 minute_40 minute_45 minute_50
    minute_55 minute_60 minute_65 minute_70 minute_75 minute_80 minute_85 minute_90 minute_95 minute_100
    minute_105 minute_110 minute_115 minute_120 minute_125 minute_130 minute_135 minute_140 minute_145 
    minute_150 minute_155 minute_160 minute_165 minute_170 minute_175 minute_180 minute_185 minute_190
    minute_195 minute_200 minute_205 minute_210 minute_215 minute_220 minute_225 minute_230 minute_235 
    minute_240 minute_245 minute_250 minute_255 minute_260 minute_265 minute_270 minute_275
  )
  (:action move
    :parameters (?from ?to - location ?start_time ?end_time - time_increment)
    :precondition (and
      (at ?from)
      (time ?start_time)
      (succeeding_time ?start_time ?end_time)
      (or (and (at presidio) (at marina_district) (succeeding_time ?start_time ?end_time))
          (and (at marina_district) (at presidio) (succeeding_time ?start_time ?end_time)))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (time ?start_time))
      (time ?end_time)
    )
  )
  (:action start_meeting
    :parameters (?f - friend ?loc - location ?start_time - time_increment)
    :precondition (and
      (at ?loc)
      (time ?start_time)
      (jessica_available ?start_time)
      (at marina_district)
      (equal ?f jessica)
    )
    :effect (meeting_with ?f)
  )
  (:action end_meeting
    :parameters (?f - friend ?loc - location ?end_time - time_increment)
    :precondition (and
      (meeting_with ?f)
      (time ?end_time)
      (at marina_district)
    )
    :effect (and
      (not (meeting_with ?f))
      (met_for_minimum ?f)
    )
  )
)