(define (domain multiagent_actions)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (cats ?x)
    (collect ?x ?y)
    (hand ?x)
    (next ?x ?y)
    (sneeze ?x)
    (spring ?x)
    (stupendous ?x)
    (texture ?x)
    (vase ?x ?y)
  )

  ;; paltry: requires hand, cats, texture, vase(subject,agent), next(agent, location)
  ;; Effects: create next(subject, location) and remove vase(subject,agent)
  (:action paltry
    :parameters (?s ?a ?loc)
    :precondition (and
      (hand ?s)
      (cats ?a)
      (texture ?loc)
      (vase ?s ?a)
      (next ?a ?loc)
    )
    :effect (and
      (next ?s ?loc)
      (not (vase ?s ?a))
    )
  )

  ;; sip: requires hand, cats, texture, next(subject,loc), next(agent,loc)
  ;; Effects: create vase(subject,agent) and remove next(subject,loc)
  (:action sip
    :parameters (?s ?a ?loc)
    :precondition (and
      (hand ?s)
      (cats ?a)
      (texture ?loc)
      (next ?s ?loc)
      (next ?a ?loc)
    )
    :effect (and
      (vase ?s ?a)
      (not (next ?s ?loc))
    )
  )

  ;; clip: requires hand, sneeze(agent), texture(loc), next(agent,loc), next(subject,loc)
  ;; Effects: create vase(subject,agent) and remove next(subject,loc)
  (:action clip
    :parameters (?s ?a ?loc)
    :precondition (and
      (hand ?s)
      (sneeze ?a)
      (texture ?loc)
      (next ?a ?loc)
      (next ?s ?loc)
    )
    :effect (and
      (vase ?s ?a)
      (not (next ?s ?loc))
    )
  )

  ;; wretched: requires sneeze(subject), texture(loc1), texture(loc2), stupendous(obj3),
  ;;           next(subject,loc1), collect(loc1,obj3), collect(loc2,obj3)
  ;; Effects: create next(subject,loc2) and remove next(subject,loc1)
  (:action wretched
    :parameters (?s ?loc1 ?loc2 ?obj3)
    :precondition (and
      (sneeze ?s)
      (texture ?loc1)
      (texture ?loc2)
      (stupendous ?obj3)
      (next ?s ?loc1)
      (collect ?loc1 ?obj3)
      (collect ?loc2 ?obj3)
    )
    :effect (and
      (next ?s ?loc2)
      (not (next ?s ?loc1))
    )
  )

  ;; memory: requires cats(subject), spring(loc1), spring(loc2), next(subject,loc1)
  ;; Effects: create next(subject,loc2) and remove next(subject,loc1)
  (:action memory
    :parameters (?s ?loc1 ?loc2)
    :precondition (and
      (cats ?s)
      (spring ?loc1)
      (spring ?loc2)
      (next ?s ?loc1)
    )
    :effect (and
      (next ?s ?loc2)
      (not (next ?s ?loc1))
    )
  )

  ;; tightfisted: requires hand(subject), sneeze(agent), texture(loc), next(agent,loc), vase(subject,agent)
  ;; Effects: create next(subject,loc) and remove vase(subject,agent)
  (:action tightfisted
    :parameters (?s ?a ?loc)
    :precondition (and
      (hand ?s)
      (sneeze ?a)
      (texture ?loc)
      (next ?a ?loc)
      (vase ?s ?a)
    )
    :effect (and
      (next ?s ?loc)
      (not (vase ?s ?a))
    )
  )
)