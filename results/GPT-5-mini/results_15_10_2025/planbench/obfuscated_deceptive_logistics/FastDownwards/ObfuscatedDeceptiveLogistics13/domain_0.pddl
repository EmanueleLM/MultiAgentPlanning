(define (domain orchestrated)
  (:requirements :strips)
  (:predicates
    ;; Required/mentioned predicates
    (hand ?agent ?obj)
    (cats ?cat)
    (texture ?obj ?tex)
    (vase ?obj)
    (next ?loc1 ?loc2)
    (sneeze ?agent)
    (spring)
    (collect ?agent ?obj)
    (stupendous ?obj)

    ;; Additional predicates used to model precondition/state without negated preconditions
    (at ?thing ?loc)
    (available ?obj)        ; object can still be collected
    (can_collect ?agent)    ; agent is able to collect (not tightfisted)
    (remembered ?agent ?obj)
    (tightfisted ?agent)
  )

  ;; paltry: agent collects a vase present at same location (requires availability and ability to collect)
  (:action paltry
    :parameters (?agent ?obj ?loc)
    :precondition (and (at ?agent ?loc) (at ?obj ?loc) (vase ?obj) (available ?obj) (can_collect ?agent))
    :effect (and
      (collect ?agent ?obj)
      (hand ?agent ?obj)
      (stupendous ?obj)
      (not (available ?obj))
      (not (at ?obj ?loc))
    )
  )

  ;; sip: agent sips an object with a liquid texture, causing a sneeze (side-effect)
  (:action sip
    :parameters (?agent ?obj)
    :precondition (and (hand ?agent ?obj) (texture ?obj liquid))
    :effect (and (sneeze ?agent))
  )

  ;; clip: move agent from one location to a directly next location
  (:action clip
    :parameters (?agent ?from ?to)
    :precondition (and (at ?agent ?from) (next ?from ?to))
    :effect (and (at ?agent ?to) (not (at ?agent ?from)))
  )

  ;; wretched: agent mishandles an object in hand, breaking the vase and removing stupendous status
  (:action wretched
    :parameters (?agent ?obj ?loc)
    :precondition (and (hand ?agent ?obj) (at ?agent ?loc))
    :effect (and
      (not (vase ?obj))
      (not (stupendous ?obj))
      (not (hand ?agent ?obj))
      (at ?obj ?loc)
      (not (available ?obj))
    )
  )

  ;; memory: agent forms a memory of an object it has collected
  (:action memory
    :parameters (?agent ?obj)
    :precondition (and (collect ?agent ?obj))
    :effect (and (remembered ?agent ?obj))
  )

  ;; tightfisted: agent becomes unwilling to collect further items (removes can_collect)
  (:action tightfisted
    :parameters (?agent)
    :precondition (and )
    :effect (and (tightfisted ?agent) (not (can_collect ?agent)))
  )
)