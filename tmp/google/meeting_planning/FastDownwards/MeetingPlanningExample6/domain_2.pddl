(define (domain multi-agent-meet)
  (:requirements :typing :equality)
  (:types location timepoint)

  (:predicates
     (visitor_at ?l - location)
     (kenneth_at ?l - location)
     (at_time ?t - timepoint)
     (met_kenneth)
     (meet_p0) (meet_p1) (meet_p2) (meet_p3) (meet_p4)
     (meet_p5) (meet_p6) (meet_p7) (meet_p8) (meet_p9)
     (next_time ?t1 ?t2 - timepoint)
  )

  (:action drive_visitor
     :parameters (?from - location ?to - location ?t - timepoint ?t_next - timepoint)
     :precondition (and (visitor_at ?from) (at_time ?t) (next_time ?t ?t_next))
     :effect (and (not (visitor_at ?from)) (visitor_at ?to) (at_time ?t_next))
  )

  (:action drive_kenneth
     :parameters (?from - location ?to - location ?t - timepoint ?t_next - timepoint)
     :precondition (and (kenneth_at ?from) (at_time ?t) (next_time ?t ?t_next))
     :effect (and (not (kenneth_at ?from)) (kenneth_at ?to) (at_time ?t_next))
  )

  (:action wait
     :parameters (?t - timepoint ?t_next - timepoint)
     :precondition (and (at_time ?t) (next_time ?t ?t_next))
     :effect (at_time ?t_next)
  )

  (:action meet_block1
     :parameters (?l - location ?t - timepoint ?t_next - timepoint)
     :precondition (and (meet_p0) (visitor_at ?l) (kenneth_at ?l) (at_time ?t) (next_time ?t ?t_next) (= ?l nob_hill))
     :effect (and (not (meet_p0)) (meet_p1) (at_time ?t_next))
  )

  (:action meet_block2
     :parameters (?l - location ?t - timepoint ?t_next - timepoint)
     :precondition (and (meet_p1) (visitor_at ?l) (kenneth_at ?l) (at_time ?t) (next_time ?t ?t_next) (= ?l nob_hill))
     :effect (and (not (meet_p1)) (meet_p2) (at_time ?t_next))
  )

  (:action meet_block3
     :parameters (?l - location ?t - timepoint ?t_next - timepoint)
     :precondition (and (meet_p2) (visitor_at ?l) (kenneth_at ?l) (at_time ?t) (next_time ?t ?t_next) (= ?l nob_hill))
     :effect (and (not (meet_p2)) (meet_p3) (at_time ?t_next))
  )

  (:action meet_block4
     :parameters (?l - location ?t - timepoint ?t_next - timepoint)
     :precondition (and (meet_p3) (visitor_at ?l) (kenneth_at ?l) (at_time ?t) (next_time ?t ?t_next) (= ?l nob_hill))
     :effect (and (not (meet_p3)) (meet_p4) (at_time ?t_next))
  )

  (:action meet_block5
     :parameters (?l - location ?t - timepoint ?t_next - timepoint)
     :precondition (and (meet_p4) (visitor_at ?l) (kenneth_at ?l) (at_time ?t) (next_time ?t ?t_next) (= ?l nob_hill))
     :effect (and (not (meet_p4)) (meet_p5) (at_time ?t_next))
  )

  (:action meet_block6
     :parameters (?l - location ?t - timepoint ?t_next - timepoint)
     :precondition (and (meet_p5) (visitor_at ?l) (kenneth_at ?l) (at_time ?t) (next_time ?t ?t_next) (= ?l nob_hill))
     :effect (and (not (meet_p5)) (meet_p6) (at_time ?t_next))
  )

  (:action meet_block7
     :parameters (?l - location ?t - timepoint ?t_next - timepoint)
     :precondition (and (meet_p6) (visitor_at ?l) (kenneth_at ?l) (at_time ?t) (next_time ?t ?t_next) (= ?l nob_hill))
     :effect (and (not (meet_p6)) (meet_p7) (at_time ?t_next))
  )

  (:action meet_block8
     :parameters (?l - location ?t - timepoint ?t_next - timepoint)
     :precondition (and (meet_p7) (visitor_at ?l) (kenneth_at ?l) (at_time ?t) (next_time ?t ?t_next) (= ?l nob_hill))
     :effect (and (not (meet_p7)) (meet_p8) (at_time ?t_next))
  )

  (:action meet_block9
     :parameters (?l - location ?t - timepoint ?t_next - timepoint)
     :precondition (and (meet_p8) (visitor_at ?l) (kenneth_at ?l) (at_time ?t) (next_time ?t ?t_next) (= ?l nob_hill))
     :effect (and (not (meet_p8)) (meet_p9) (at_time ?t_next) (met_kenneth))
  )
)