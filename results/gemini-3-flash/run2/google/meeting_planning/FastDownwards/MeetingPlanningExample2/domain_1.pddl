(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time count)
  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next_time ?t_now ?t_next - time)
    (jessica_at ?l - location ?t - time)
    (met_jessica_count ?c - count)
    (next_count ?c_now ?c_next - count)
    (connected ?l1 ?l2 - location)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t_now - time ?t_next - time)
    :precondition (and (at ?from) (current_time ?t_now) (next_time ?t_now ?t_next) (connected ?from ?to))
    :effect (and (not (at ?from)) (at ?to) (not (current_time ?t_now)) (current_time ?t_next))
  )

  (:action wait
    :parameters (?l - location ?t_now - time ?t_next - time)
    :precondition (and (at ?l) (current_time ?t_now) (next_time ?t_now ?t_next))
    :effect (and (not (current_time ?t_now)) (current_time ?t_next))
  )

  (:action meet_jessica
    :parameters (?l - location ?t_now - time ?t_next - time ?c_now - count ?c_next - count)
    :precondition (and (at ?l) (current_time ?t_now) (next_time ?t_now ?t_next)
                       (jessica_at ?l ?t_now)
                       (met_jessica_count ?c_now) (next_count ?c_now ?c_next))
    :effect (and (not (current_time ?t_now)) (current_time ?t_next)
                 (not (met_jessica_count ?c_now)) (met_jessica_count ?c_next))
  )
)