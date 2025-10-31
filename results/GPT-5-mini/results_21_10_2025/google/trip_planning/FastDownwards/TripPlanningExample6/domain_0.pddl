(define (domain multiagent-travel)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (in ?c - city ?d - day)        ; traveller is in city c on day d
    (next ?d1 - day ?d2 - day)     ; sequential day relation
  )

  ;; ---- Actions provided by the Berlin planner (agent: berlin_planner) ----
  ;; Stay in Berlin from day d to next day d2
  (:action berlin_planner_stay_berlin
    :parameters (?d - day ?d2 - day)
    :precondition (and (in berlin ?d) (next ?d ?d2))
    :effect (and (in berlin ?d2))
  )

  ;; Direct flight Berlin -> Munich between consecutive days
  (:action berlin_planner_fly_berlin_to_munich
    :parameters (?d - day ?d2 - day)
    :precondition (and (in berlin ?d) (next ?d ?d2))
    :effect (and (in munich ?d2))
  )

  ;; Two-leg same-day connection Berlin -> Munich -> Dubrovnik (modeled as one transition between consecutive days)
  ;; This is allowed because Munich<->Berlin and Munich<->Dubrovnik exist; no direct Berlin<->Dubrovnik flight exists.
  (:action berlin_planner_via_munich_to_dubrovnik
    :parameters (?d - day ?d2 - day)
    :precondition (and (in berlin ?d) (next ?d ?d2))
    :effect (and (in dubrovnik ?d2))
  )

  ;; ---- Actions provided by the Munich planner (agent: munich_planner) ----
  ;; Stay in Munich
  (:action munich_planner_stay_munich
    :parameters (?d - day ?d2 - day)
    :precondition (and (in munich ?d) (next ?d ?d2))
    :effect (and (in munich ?d2))
  )

  ;; Direct flight Munich -> Berlin
  (:action munich_planner_fly_munich_to_berlin
    :parameters (?d - day ?d2 - day)
    :precondition (and (in munich ?d) (next ?d ?d2))
    :effect (and (in berlin ?d2))
  )

  ;; Direct flight Munich -> Dubrovnik
  (:action munich_planner_fly_munich_to_dubrovnik
    :parameters (?d - day ?d2 - day)
    :precondition (and (in munich ?d) (next ?d ?d2))
    :effect (and (in dubrovnik ?d2))
  )

  ;; ---- Actions provided by the Dubrovnik planner (agent: dubrovnik_planner) ----
  ;; Stay in Dubrovnik
  (:action dubrovnik_planner_stay_dubrovnik
    :parameters (?d - day ?d2 - day)
    :precondition (and (in dubrovnik ?d) (next ?d ?d2))
    :effect (and (in dubrovnik ?d2))
  )

  ;; Direct flight Dubrovnik -> Munich
  (:action dubrovnik_planner_fly_dubrovnik_to_munich
    :parameters (?d - day ?d2 - day)
    :precondition (and (in dubrovnik ?d) (next ?d ?d2))
    :effect (and (in munich ?d2))
  )

  ;; Two-leg same-day connection Dubrovnik -> Munich -> Berlin (modeled as one transition between consecutive days)
  (:action dubrovnik_planner_via_munich_to_berlin
    :parameters (?d - day ?d2 - day)
    :precondition (and (in dubrovnik ?d) (next ?d ?d2))
    :effect (and (in berlin ?d2))
  )
)