(define (domain meeting_planning)
  (:requirements :typing)
  (:types location time duration)
  (:constants bayview chinatown - location)
  (:predicates
    (at_loc ?l - location)
    (time_now ?t - time)
    (met_duration ?d - duration)
    (next_t ?t1 ?t2 - time)
    (next_d ?d1 ?d2 - duration)
    (dist_18 ?t1 ?t2 - time)
    (dist_22 ?t1 ?t2 - time)
  )

  ;; Travel from Bayview to Chinatown takes 18 minutes.
  (:action travel_bayview_to_chinatown
    :parameters (?t_now ?t_future - time)
    :precondition (and (at_loc bayview) (time_now ?t_now) (dist_18 ?t_now ?t_future))
    :effect (and (not (at_loc bayview)) (at_loc chinatown) (not (time_now ?t_now)) (time_now ?t_future))
  )

  ;; Travel from Chinatown to Bayview takes 22 minutes.
  (:action travel_chinatown_to_bayview
    :parameters (?t_now ?t_future - time)
    :precondition (and (at_loc chinatown) (time_now ?t_now) (dist_22 ?t_now ?t_future))
    :effect (and (not (at_loc chinatown)) (at_loc bayview) (not (time_now ?t_now)) (time_now ?t_future))
  )

  ;; Meeting Jason at Chinatown. Each action represents 1 minute of meeting time.
  ;; Jason is available at Chinatown from 8:30 AM to 12:30 PM.
  ;; Since we arrive at 9:00 AM (t0) and the model ends at 12:30 PM (t210),
  ;; Jason is implicitly available whenever the planner is at Chinatown.
  (:action meet_jason
    :parameters (?t_now ?t_next - time ?d_now ?d_next - duration)
    :precondition (and
      (at_loc chinatown)
      (time_now ?t_now)
      (next_t ?t_now ?t_next)
      (met_duration ?d_now)
      (next_d ?d_now ?d_next)
    )
    :effect (and
      (not (time_now ?t_now))
      (time_now ?t_next)
      (not (met_duration ?d_now))
      (met_duration ?d_next)
    )
  )

  ;; Waiting for 1 minute at the current location.
  (:action wait
    :parameters (?t_now ?t_next - time)
    :precondition (and (time_now ?t_now) (next_t ?t_now ?t_next))
    :effect (and (not (time_now ?t_now)) (time_now ?t_next))
  )
)