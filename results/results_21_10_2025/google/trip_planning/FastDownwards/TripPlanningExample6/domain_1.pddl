(define (domain TripPlanningExample6)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (in ?c - city ?d - day)             ; traveller is in city ?c on day ?d
    (next ?d1 - day ?d2 - day)         ; sequential day relation
    (occupied ?d - day)                ; day ?d has been assigned (prevents multiple assignments)
    (visited-munich)                   ; record that Munich has been visited at least once
    (visited-dubrovnik)                ; record that Dubrovnik has been visited at least once
  )

  ;; -------------------------
  ;; Berlin planner actions
  ;; -------------------------
  (:action berlin_planner_stay_berlin
    :parameters (?d - day ?d2 - day)
    :precondition (and (in berlin ?d) (next ?d ?d2) (not (occupied ?d2)))
    :effect (and (in berlin ?d2) (occupied ?d2))
  )

  (:action berlin_planner_fly_berlin_to_munich
    :parameters (?d - day ?d2 - day)
    :precondition (and (in berlin ?d) (next ?d ?d2) (not (occupied ?d2)))
    :effect (and (in munich ?d2) (occupied ?d2) (visited-munich))
  )

  ;; Note: No direct Berlin -> Dubrovnik flight action is provided (only via Munich is possible,
  ;; which must use two consecutive actions Berlin->Munich then Munich->Dubrovnik).

  ;; -------------------------
  ;; Munich planner actions
  ;; -------------------------
  (:action munich_planner_stay_munich
    :parameters (?d - day ?d2 - day)
    :precondition (and (in munich ?d) (next ?d ?d2) (not (occupied ?d2)))
    :effect (and (in munich ?d2) (occupied ?d2) (visited-munich))
  )

  (:action munich_planner_fly_munich_to_berlin
    :parameters (?d - day ?d2 - day)
    :precondition (and (in munich ?d) (next ?d ?d2) (not (occupied ?d2)))
    :effect (and (in berlin ?d2) (occupied ?d2))
  )

  (:action munich_planner_fly_munich_to_dubrovnik
    :parameters (?d - day ?d2 - day)
    :precondition (and (in munich ?d) (next ?d ?d2) (not (occupied ?d2)))
    :effect (and (in dubrovnik ?d2) (occupied ?d2) (visited-dubrovnik))
  )

  ;; -------------------------
  ;; Dubrovnik planner actions
  ;; -------------------------
  (:action dubrovnik_planner_stay_dubrovnik
    :parameters (?d - day ?d2 - day)
    :precondition (and (in dubrovnik ?d) (next ?d ?d2) (not (occupied ?d2)))
    :effect (and (in dubrovnik ?d2) (occupied ?d2) (visited-dubrovnik))
  )

  (:action dubrovnik_planner_fly_dubrovnik_to_munich
    :parameters (?d - day ?d2 - day)
    :precondition (and (in dubrovnik ?d) (next ?d ?d2) (not (occupied ?d2)))
    :effect (and (in munich ?d2) (occupied ?d2) (visited-munich))
  )
)