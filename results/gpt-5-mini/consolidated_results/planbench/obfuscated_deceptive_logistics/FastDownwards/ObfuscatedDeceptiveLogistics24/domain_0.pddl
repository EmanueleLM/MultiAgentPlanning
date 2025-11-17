(define (domain collection-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent object place)

  (:predicates
    ;; agent state
    (hand_free ?a - agent)
    (holding ?a - agent ?o - object)
    (sneeze ?a - agent)
    (know_location ?a - agent ?o - object)

    ;; object classification
    (vase ?o - object)
    (cup ?o - object)
    (fragile ?o - object)
    (box ?b - object)
    (shelf ?s - object)

    ;; spatial / containment
    (next ?o - object ?loc - place)  ;; object/cat is at a place

    ;; obstruction model
    (cats ?c - object)
    (obstructs ?c - object ?o - object)  ;; cat c obstructs object o
    (obstructed ?o - object)            ;; object o is currently obstructed

    ;; goal / auxiliary predicates
    (collect ?o - object)
    (stupendous ?o - object)
    (secure ?o - object)
  )

  ;; memory action: agent learns/recalls an object's location
  (:action memory
    :parameters (?a - agent ?o - object)
    :precondition (hand_free ?a)
    :effect (know_location ?a ?o)
  )

  ;; paltry: pick up a non-fragile or generic object.
  ;; This operator requires the agent to know the object's location and that the object is not currently obstructed.
  (:action paltry
    :parameters (?a - agent ?o - object ?loc - place)
    :precondition (and
                    (hand_free ?a)
                    (know_location ?a ?o)
                    (next ?o ?loc)
                    (not (obstructed ?o))
                  )
    :effect (and
              (not (hand_free ?a))
              (holding ?a ?o)
              (not (next ?o ?loc))
            )
  )

  ;; paltry-fragile: pick up a fragile object (requires agent not sneezing)
  (:action paltry-fragile
    :parameters (?a - agent ?o - object ?loc - place)
    :precondition (and
                    (hand_free ?a)
                    (know_location ?a ?o)
                    (next ?o ?loc)
                    (fragile ?o)
                    (not (sneeze ?a))
                    (not (obstructed ?o))
                  )
    :effect (and
              (not (hand_free ?a))
              (holding ?a ?o)
              (not (next ?o ?loc))
            )
  )

  ;; sip: drink from a cup the agent is holding; it stops sneezing and frees the hand by placing the cup back at the supplied location
  (:action sip
    :parameters (?a - agent ?c - object ?loc - place)
    :precondition (and
                    (holding ?a ?c)
                    (cup ?c)
                  )
    :effect (and
              (not (holding ?a ?c))
              (hand_free ?a)
              (not (sneeze ?a))
              (next ?c ?loc)
            )
  )

  ;; clip-to-shelf: place an object on a shelf; marks it collected
  (:action clip-to-shelf
    :parameters (?a - agent ?o - object ?s - object ?sloc - place)
    :precondition (and
                    (holding ?a ?o)
                    (shelf ?s)
                    (next ?s ?sloc)
                  )
    :effect (and
              (not (holding ?a ?o))
              (next ?o ?s)
              (collect ?o)
            )
  )

  ;; clip-to-box: place an object into a box; requires it be secured, marks collected and stupendous
  (:action clip-to-box
    :parameters (?a - agent ?o - object ?b - object ?bloc - place)
    :precondition (and
                    (holding ?a ?o)
                    (box ?b)
                    (next ?b ?bloc)
                    (secure ?o)
                  )
    :effect (and
              (not (holding ?a ?o))
              (next ?o ?b)
              (collect ?o)
              (stupendous ?o)
            )
  )

  ;; wretched: distract / move a cat that obstructs a specific object
  (:action wretched
    :parameters (?a - agent ?cat - object ?obj - object ?from - place ?to - place)
    :precondition (and
                    (hand_free ?a)
                    (cats ?cat)
                    (next ?cat ?from)
                    (obstructs ?cat ?obj)
                  )
    :effect (and
              (not (next ?cat ?from))
              (next ?cat ?to)
              (not (obstructs ?cat ?obj))
              (not (obstructed ?obj))
            )
  )

  ;; tightfisted: secure a held object (prevent accidental drops); must be holding the object
  (:action tightfisted
    :parameters (?a - agent ?o - object)
    :precondition (holding ?a ?o)
    :effect (secure ?o)
  )

)