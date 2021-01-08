#lang at-exp codespells

(require towers/mod-info)

(require-mod crystals)
(require-mod fire-particles)

(define-classic-rune (tower)
  #:background "blue"
  #:foreground (circle 40 'solid 'blue)
  #;(orange-crystal)
  (thunk
   @unreal-js{
 (function(){

  var t = @(orange-crystal)

  var t_bounds = GameplayStatics.GetActorArrayBounds([t], false); 

  var f = @(at
            [0 0 0]
            (flames));

  f.AttachActorToActor(t);

  f.SetActorScale3D({X:1,Y:1,Z:1});

  //Magic number here.  Why is t_bounds.BoxExtent.Z so big?
  f.SetActorRelativeLocation({X:0, Y:0, Z:85});

  console.log(t_bounds.BoxExtent.Z);
  
  return t;
  })()
 }))


#|
     var as = [@(if (procedure? a) (a) a)].flat();

       var a_bounds = GameplayStatics.GetActorArrayBounds(as, false); 

       var a_to_move_Z = @(~a padding) + a_bounds.BoxExtent.Z / 2
       as.map((a)=>{
         a.SetActorLocation({X: a.GetActorLocation().X, Y: a.GetActorLocation().Y, Z: a.GetActorLocation().Z + a_to_move_Z})
       })
|#

(define-classic-rune-lang my-mod-lang #:eval-from main.rkt
  (tower))

(module+ main
  (codespells-workspace ;TODO: Change this to your local workspace if different
   (build-path (current-directory) ".." ".."))
  
  (once-upon-a-time
   #:world (arena-world)
   #:aether (demo-aether
             #:lang (my-mod-lang #:with-paren-runes? #t))))