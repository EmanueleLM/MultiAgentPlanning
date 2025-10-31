(define (domain orchestrated)
  (:requirements :strips)
  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (vase ?s ?x)
    (next ?a ?b)
    (sneeze ?o)
    (spring ?o)
    (collect ?x ?y)
    (stupendous ?o)
  )

  ;; paltry(subject, x, y)
  ;; Preconditions: hand(subject), cats(x), texture(y), vase(subject,x), next(x,y)
  ;; Effects: add next(subject,y); del vase(subject,x)
  (:action paltry
    :parameters (?subject ?x ?y)
    :precondition (and
      (hand ?subject)
      (cats ?x)
      (texture ?y)
      (vase ?subject ?x)
      (next ?x ?y)
    )
    :effect (and
      (next ?subject ?y)
      (not (vase ?subject ?x))
    )
  )

  ;; sip(subject, x, y)
  ;; Preconditions: hand(subject), cats(x), texture(y), next(subject,y), next(x,y)
  ;; Effects: add vase(subject,x); del next(subject,y)
  (:action sip
    :parameters (?subject ?x ?y)
    :precondition (and
      (hand ?subject)
      (cats ?x)
      (texture ?y)
      (next ?subject ?y)
      (next ?x ?y)
    )
    :effect (and
      (vase ?subject ?x)
      (not (next ?subject ?y))
    )
  )

  ;; clip(subject, x, y)
  ;; Preconditions: hand(subject), sneeze(x), texture(y), next(x,y), next(subject,y)
  ;; Effects: add vase(subject,x); del next(subject,y)
  (:action clip
    :parameters (?subject ?x ?y)
    :precondition (and
      (hand ?subject)
      (sneeze ?x)
      (texture ?y)
      (next ?x ?y)
      (next ?subject ?y)
    )
    :effect (and
      (vase ?subject ?x)
      (not (next ?subject ?y))
    )
  )

  ;; wretched(x, y, z, w)
  ;; Preconditions: sneeze(x), texture(y), texture(z), stupendous(w), next(x,y), collect(y,w), collect(z,w)
  ;; Effects: add next(x,z); del next(x,y)
  (:action wretched
    :parameters (?x ?y ?z ?w)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?w)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  ;; memory(x, y, z)
  ;; Preconditions: cats(x), spring(y), spring(z), next(x,y)
  ;; Effects: add next(x,z); del next(x,y)
  (:action memory
    :parameters (?x ?y ?z)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  ;; tightfisted(subject, x, y)
  ;; Preconditions: hand(subject), sneeze(x), texture(y), next(x,y), vase(subject,x)
  ;; Effects: add next(subject,y); del vase(subject,x)
  (:action tightfisted
    :parameters (?subject ?x ?y)
    :precondition (and
      (hand ?subject)
      (sneeze ?x)
      (texture ?y)
      (next ?x ?y)
      (vase ?subject ?x)
    )
    :effect (and
      (next ?subject ?y)
      (not (vase ?subject ?x))
    )
  )

)