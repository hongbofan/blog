/**
 * Created by DELL on 2018/2/5.
 */
define(["require", "exports"], function (require, exports) {
    "use strict";
    var NatureObject = (function () {
        function NatureObject(location, velocity, acceleration) {
            this.location = location;
            this.velocity = velocity;
            this.acceleration = acceleration;
            this.destroy = false;
        }
        NatureObject.prototype.isDestroy = function () {
            return this.destroy;
        };
        NatureObject.prototype.display = function (paint) {
            return this;
        };
        NatureObject.prototype.move = function () {
            this.velocity.add(this.acceleration);
            this.location.add(this.velocity);
            return this;
        };
        NatureObject.prototype.collisionDetection = function (system) {
            if (this.location.x > system.width || this.location.x < 0) {
                this.velocity.x += this.acceleration.x;
                this.velocity.x *= -1;
            }
            if (this.location.y > system.height || this.location.y < 0) {
                this.velocity.y += this.acceleration.y;
                this.velocity.y *= -1;
            }
            return this;
        };
        return NatureObject;
    }());
    exports.NatureObject = NatureObject;
});
//# sourceMappingURL=NatureObject.js.map