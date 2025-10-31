(define (domain multiagent-travel)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at ?c - city)
    (day-now ?d - day)
    (day-next ?d1 ?d2 - day)
    (visited ?c - city ?d - day)
  )

  (:action manchester-stay
    :parameters (?d - day ?e - day)
    :precondition (and (at manchester) (day-now ?d) (day-next ?d ?e))
    :effect (and
              (not (day-now ?d))
              (day-now ?e)
              (visited manchester ?d)
            )
  )

  (:action manchester-fly-to-bucharest
    :parameters ()
    :precondition (at manchester)
    :effect (and
              (not (at manchester))
              (at bucharest)
            )
  )

  (:action bucharest-stay
    :parameters (?d - day ?e - day)
    :precondition (and (at bucharest) (day-now ?d) (day-next ?d ?e))
    :effect (and
              (not (day-now ?d))
              (day-now ?e)
              (visited bucharest ?d)
            )
  )

  (:action bucharest-fly-to-manchester
    :parameters ()
    :precondition (at bucharest)
    :effect (and
              (not (at bucharest))
              (at manchester)
            )
  )

  (:action bucharest-fly-to-lyon
    :parameters ()
    :precondition (at bucharest)
    :effect (and
              (not (at bucharest))
              (at lyon)
            )
  )

  (:action lyon-stay
    :parameters (?d - day ?e - day)
    :precondition (and (at lyon) (day-now ?d) (day-next ?d ?e))
    :effect (and
              (not (day-now ?d))
              (day-now ?e)
              (visited lyon ?d)
            )
  )

  (:action lyon-fly-to-bucharest
    :parameters ()
    :precondition (at lyon)
    :effect (and
              (not (at lyon))
              (at bucharest)
            )
  )
)