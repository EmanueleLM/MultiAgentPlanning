(define (domain orchestrated-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent object cat texture location)

  ;; Predicates explicitly required and additional supporting predicates
  (:predicates
    (hand ?a - agent ?o - object)            ; agent holds object
    (cats ?c - cat)                          ; cat exists/present
    (texture ?o - object ?t - texture)       ; object has a texture
    (vase ?o - object)                       ; object is a vase
    (next ?l1 - location ?l2 - location)     ; adjacency between locations
    (sneeze ?a - agent)                      ; agent has sneezed (state)
    (spring ?l - location)                   ; location contains a spring
    (collect ?a - agent ?o - object)         ; agent has collected object
    (stupendous ?o - object)                 ; object is stupendous
    ;; Supporting predicates
    (at ?x - (either agent object) ?l - location) ; agent or object at a location
    (available ?o - object)                  ; object is available to pick up
    (clipped ?o - object)                    ; object has a clip attached
    (drunk ?a - agent)                       ; agent has drunk something
    (remembered ?a - agent ?o - object)      ; agent remembers object
    (tight_hold ?a - agent ?o - object)      ; tightfisted hold marker
  )

  ;; ACTION: paltry
  ;; Agent picks up an available object at the same location and marks it collected.
  (:action paltry
    :parameters (?a - agent ?o - object ?l - location)
    :precondition (and
                    (at ?a ?l)
                    (at ?o ?l)
                    (available ?o)
                    (not (hand ?a ?o))
                  )
    :effect (and
              (hand ?a ?o)
              (collect ?a ?o)
              (not (available ?o))
              (not (at ?o ?l))
            )
  )

  ;; ACTION: sip
  ;; Agent drinks an item it holds; drinking always causes sneezing in this model
  ;; (conservative assumption given absent analyst details).
  (:action sip
    :parameters (?a - agent ?cup - object ?l - location ?t - texture)
    :precondition (and
                    (hand ?a ?cup)
                    (at ?a ?l)
                    (texture ?cup ?t)
                  )
    :effect (and
              (drunk ?a)
              (sneeze ?a)
            )
  )

  ;; ACTION: clip
  ;; Agent attaches a clip to an object it holds (protect/mark).
  (:action clip
    :parameters (?a - agent ?o - object)
    :precondition (and
                    (hand ?a ?o)
                    (not (clipped ?o))
                  )
    :effect (and
              (clipped ?o)
            )
  )

  ;; ACTION: wretched
  ;; Agent takes an object from another agent (steal). Distinct role implied.
  (:action wretched
    :parameters (?thief - agent ?victim - agent ?o - object ?l - location)
    :precondition (and
                    (hand ?victim ?o)
                    (at ?thief ?l)
                    (at ?victim ?l)
                    (not (hand ?thief ?o))
                  )
    :effect (and
              (hand ?thief ?o)
              (not (hand ?victim ?o))
            )
  )

  ;; ACTION: memory
  ;; Agent records memory of a collected object and marks object stupendous.
  (:action memory
    :parameters (?a - agent ?o - object)
    :precondition (and
                    (collect ?a ?o)
                    (not (remembered ?a ?o))
                  )
    :effect (and
              (remembered ?a ?o)
              (stupendous ?o)
            )
  )

  ;; ACTION: tightfisted
  ;; Agent marks that it is holding an object tightly (prevents giving it away).
  (:action tightfisted
    :parameters (?a - agent ?o - object)
    :precondition (and
                    (hand ?a ?o)
                    (not (tight_hold ?a ?o))
                  )
    :effect (and
              (tight_hold ?a ?o)
            )
  )

  ;; Support action: move (added to permit reaching goal locations)
  (:action move
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
                    (at ?a ?from)
                    (next ?from ?to)
                  )
    :effect (and
              (at ?a ?to)
              (not (at ?a ?from))
            )
  )
)